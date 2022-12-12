import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/config/admob_config.dart';
import 'package:untitled/config/app_config.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/models/cuisine.dart';
import 'package:untitled/models/recipe.dart';
import 'package:untitled/models/recipe_page.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/widgets/home_recipe_item.dart';
import 'package:untitled/widgets/shimmer_loading.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:native_admob_flutter/native_admob_flutter.dart';

enum ListType { Newest, Category, Cuisine }

class RecipesListScreen extends StatefulWidget {
  final Category? category;
  final Cuisine? cuisine;
  final ListType? listType;

  const RecipesListScreen(
      {Key? key, this.category, this.cuisine, this.listType})
      : super(key: key);

  @override
  _RecipesListScreenState createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refreshKey = GlobalKey();

  List<Recipe> _recipes = [];
  bool _isFetching = true;
  int _recipesPage = 1;

  var _paddingBottom = AppConfig.AdmobEnabled ? 48.0 : 0.0;

  // BannerAd? bannerAd;

  @override
  void initState() {
    super.initState();

    _fetchRecipes();
    // _loadAndShowAd();
  }

  @override
  void dispose() {
    super.dispose();
    // bannerAd!.dispose();
  }


  _fetchRecipes() async {
    RecipePage? recipePage;
    switch (widget.listType) {
      case ListType.Newest:
        recipePage = (await ApiRepository.fetchNewestRecipes(_recipesPage))!;
        break;
      case ListType.Category:
        recipePage = await ApiRepository.fetchRecipeByCategory(
            (widget.category?.id)!, _recipesPage);
        break;
      case ListType.Cuisine:
        recipePage = (await ApiRepository.fetchRecipeByCuisine(
            (widget.cuisine?.id)!, _recipesPage))!;
        break;
      default:
        recipePage = (await ApiRepository.fetchNewestRecipes(_recipesPage))!;
    }

    if (mounted)
      setState(() {
        _recipes = recipePage!.data!;
        _isFetching = false;
      });
  }

  _onRefresh() async {
    RecipePage recipePage;

    setState(() {
      _isFetching = true;
    });
    switch (widget.listType) {
      case ListType.Newest:
        recipePage = (await ApiRepository.fetchNewestRecipes(1))!;
        break;
      case ListType.Category:
        recipePage = (await ApiRepository.fetchRecipeByCategory(
            (widget.category?.id)!, 1))!;
        break;
      case ListType.Cuisine:
        recipePage = (await ApiRepository.fetchRecipeByCuisine(
            (widget.cuisine!.id)!, 1))!;
        break;
      default:
        recipePage = (await ApiRepository.fetchNewestRecipes(1))!;
    }

    _recipes.clear();
    _recipesPage = 1;
    _recipes.addAll(recipePage.data!);

    if (mounted)
      setState(() {
        // _refreshController.refreshCompleted();
        _isFetching = false;
      });
  }

  _onLoading() async {
    RecipePage recipePage;
    _recipesPage++;
    switch (widget.listType) {
      case ListType.Newest:
        recipePage = (await ApiRepository.fetchNewestRecipes(_recipesPage))!;
        break;
      case ListType.Category:
        recipePage = (await ApiRepository.fetchRecipeByCategory(
            (widget.category?.id)!, _recipesPage))!;
        break;
      case ListType.Cuisine:
        recipePage = (await ApiRepository.fetchRecipeByCuisine(
            (widget.cuisine!.id)!, _recipesPage))!;
        break;
      default:
        recipePage = (await ApiRepository.fetchNewestRecipes(_recipesPage))!;
    }
    _recipes.addAll(recipePage.data!);
    if (mounted)
      setState(() {
        // _refreshController.loadComplete();
      });
  }

  String _displayName() {
    switch (widget.listType) {
      case ListType.Newest:
        return 'recent_recipes'.tr();
      case ListType.Category:
        return (widget.category!.name)!;
      case ListType.Cuisine:
        return (widget.cuisine!.name)!;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        _displayName(),
        style: TextStyle(color: Colors.black, fontFamily: 'Brandon'),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  _body() {
    return _isFetching
        ? ShimmerLoading(type: ShimmerType.Recipes)
        : Stack(
            children: [
              _recipes.isNotEmpty
                  ? ListView.builder(
                key: _contentKey,
                padding:
                EdgeInsets.only(top: 10, bottom: _paddingBottom),
                itemBuilder: (ctx, index) => HomeRecipeItem(
                  recipe: _recipes[index],
                ),
                itemCount: _recipes.length,
              )
                  : Center(
                child: Text(
                  "no_recipes_to_display".tr(),
                  style: GoogleFonts.pacifico(fontSize: 17),
                ),
              ),

            ],
          );
  }

}
