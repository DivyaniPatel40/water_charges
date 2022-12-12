import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/cuisine.dart';
import 'package:untitled/providers/cuisine_provider.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/widgets/grid_view_item.dart';
import 'package:untitled/widgets/shimmer_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class CuisineScreen extends StatefulWidget {
  static const routeName = '/categories';

  @override
  _CuisineScreenState createState() => _CuisineScreenState();
}

class _CuisineScreenState extends State<CuisineScreen> {
  late CuisineProvider _cuisineProvider;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refreshKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _cuisineProvider = Provider.of<CuisineProvider>(context, listen: false);
    _fetchCategories();
  }

  _fetchCategories() async {
    await Provider.of<CuisineProvider>(context, listen: false)
        .fetchOrDisplayPaginatedCuisines();
  }

  _onRefresh() async {
    await _cuisineProvider.fetchCuisines(refresh: true);
    if (mounted)
      setState(() {
        // _refreshController.refreshCompleted();
      });
  }

  _onLoading() async {
    await _cuisineProvider.fetchCuisines(loading: true);
    if (mounted)
      setState(() {
        // _refreshController.loadComplete();
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'cuisines'.tr(),
        style: TextStyle(color: Colors.black, fontFamily: 'Brandon'),
      ),
    );
  }

  _body() {
    return Consumer<CuisineProvider>(
      builder: (context, cuisine, child) {
        if (cuisine.status == CuisineStatus.Fetching) {
          return ShimmerLoading(type: ShimmerType.Categories);
        } else {
          List<Cuisine> _cuisines = cuisine.paginatedCuisines;
          return _cuisines.isNotEmpty
              ?  GridView(
            key: _contentKey,
            padding: const EdgeInsets.all(15),
            children: _cuisines
                .map((cuisine) => GridViewItem(
              cuisine: cuisine,
              path: ApiRepository.CUISINE_IMAGES_PATH,
            ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          )
              : Center(
                  child: Text(
                    'no_cuisine_found'.tr(),
                    style: GoogleFonts.pacifico(fontSize: 16),
                  ),
                );
        }
      },
    );
  }
}
