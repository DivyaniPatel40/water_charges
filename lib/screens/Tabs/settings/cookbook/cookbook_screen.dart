import 'package:flutter/services.dart';
import 'package:untitled/database/cookbook_db_helper.dart';
import 'package:untitled/models/recipe.dart';
import 'package:untitled/providers/auth_provider.dart';
import 'package:untitled/screens/Tabs/settings/cookbook/widgets/cookbook_recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/widgets/shimmer_loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';

var db = new CookBookDatabaseHelper();

class CookbookScreen extends StatefulWidget {
  @override
  _CookbookScreenState createState() => _CookbookScreenState();
}

class _CookbookScreenState extends State<CookbookScreen> {
  List<Recipe>? _recipes = [];
  bool _isRetrieving = true;

  @override
  void initState() {
    super.initState();
    _getCookbookRecipes();
  }

  _getCookbookRecipes() {
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    db.getAllRecipes().then((recipeIds) async {
      String lang = EasyLocalization.of(navigatorKey.currentContext!)!
          .locale
          .languageCode;
      await ApiRepository.getUserFavorites(
              _authProvider.user!.id!, recipeIds, lang)
          .then((recipes) {
        setState(() {
          _recipes = recipes!;
          _isRetrieving = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar(),
      body: _body(queryData),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'my_cookbook'.tr(),
        style: TextStyle(color: Colors.black, fontFamily: 'Brandon'),
      ),
    );
  }

  _body(MediaQueryData queryData) {
    return Column(
      children: [
        Expanded(child: _buildRecipesList(queryData)),
      ],
    );
  }

  _buildRecipesList(MediaQueryData queryData) {
    if (_recipes != null)
      return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ShimmerLoading(
                type: ShimmerType.Cookbook,
                crossAxisCount: 2,
              ),
            );
    else
      return Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            tr('you_have_no_saved_recipes'),
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(fontSize: queryData.size.width / 20),
          ),
        ),
      );
  }
}
