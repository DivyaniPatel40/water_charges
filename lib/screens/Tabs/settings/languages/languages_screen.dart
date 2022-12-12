import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:untitled/providers/app_provider.dart';
import 'package:untitled/providers/category_provider.dart';
import 'package:untitled/providers/cuisine_provider.dart';
import 'package:untitled/providers/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Tabs/settings/languages/select_service_page.dart';
import 'package:untitled/widgets/default_custom_button.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "assets/wsp/background.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          _body(),
        ],
      )



    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.white,
      centerTitle: true,

      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle2(),

        _buildTitle(),
        SizedBox(height: 20,),
        _buildLanguagesList(),
      ],
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Center(
        child: Text(
          tr('select_language'),
          style: GoogleFonts.ubuntu(),
        ),
      ),
    );
  }

  _buildTitle2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Center(
        child: Text(
          tr('ashgabat_municipality'),
          style: GoogleFonts.ubuntu(fontSize: 22,fontWeight: FontWeight.bold),

        ),
      ),
    );
  }

 var _selected ='';

  _buildLanguagesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[

            (_selected == "en")?_buildLanguageListItemSelected(
          name: tr('english'),
          image: 'assets/images/flag_us.png',
          onTap: () {
            _selected = "en";
            context.setLocale(Locale('en', 'US'));
            _emptyLists();
            setState(() {

            });
          },
        )
                :  _buildLanguageListItem(
              name: tr('english'),
              image: 'assets/images/flag_us.png',
              onTap: () {
                _selected = "en";
                context.setLocale(Locale('en', 'US'));
                _emptyLists();
                setState(() {

                });
              },
            ),

          (_selected == "fr")?_buildLanguageListItemSelected(
            name: tr('Türkmen'),
            image: 'assets/images/flag_fr.png',
            onTap: () {
              _selected = "fr";

              context.setLocale(Locale('fr', 'FR'));
              _emptyLists();
              setState(() {

              });
            },
          )
            :
            _buildLanguageListItem(
              name: tr('Türkmen'),
              image: 'assets/images/flag_fr.png',
              onTap: () {
                _selected = "fr";

                context.setLocale(Locale('fr', 'FR'));
                _emptyLists();
                setState(() {

                });
              },
            ),


            (_selected == "ar")?_buildLanguageListItemSelected(
              name: tr('русский'),
              image: 'assets/images/flag_ar.png',
              onTap: () {
                _selected = "ar";

                context.setLocale(Locale('ar', 'AL'));
                _emptyLists();
                setState(() {

                });
              },
            ):
            _buildLanguageListItem(
              name: tr('Русский'),
              image: 'assets/images/flag_ar.png',
              onTap: () {
                _selected = "ar";

                context.setLocale(Locale('ar', 'AL'));
                _emptyLists();
                setState(() {

                });
              },
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 70),

              child: DefaultCustomButton(
                text: 'next'.tr(),
                onPressed: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => select_service_page(),
                  ),
                ),
              ),
            ),
            // _buildLanguageListItem(
            //   name: tr('languagename'),  //language name tanslated in the json files
            //   image: 'assets/images/icon.png',
            //   onTap: () {
            //     context.locale = Locale('code', 'country');
            //     _emptyLists();
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  _emptyLists() {
    Provider.of<RecipeProvider>(context, listen: false).emptyRecipeLists();
    Provider.of<CategoryProvider>(context, listen: false).emptyCategoryLists();
    Provider.of<CuisineProvider>(context, listen: false).emptyCuisineLists();
    Provider.of<AppProvider>(context, listen: false).emptyDifficultiesLists();
  }

  _buildLanguageListItem({Function? onTap, String? name, String? image}) {
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap!(),
        child: Container(
          height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
              color: Color(0xffedf6ff),
                border: Border.all(
                  color: Color(0xffedf6ff),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Center(
              child: Text(
                name!,
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
        ),
      ),
    );
  }

  _buildLanguageListItemSelected({Function? onTap, String? name, String? image}) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => onTap!(),
          child: Container(
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(
                  color: Color(0xffdef5ec),
                  border: Border.all(
                    color: Color(0xff009f49),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Text(
                  name!,
                  style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
          ),
        ),
      );
  }

}
