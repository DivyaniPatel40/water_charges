import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:untitled/config/app_config.dart';
import 'package:untitled/providers/auth_provider.dart';
import 'package:untitled/screens/Auth/login/login_screen.dart';
import 'package:untitled/screens/Other/profile/profile_screen.dart';
import 'package:untitled/screens/Tabs/settings/cookbook/cookbook_screen.dart';
import 'package:untitled/screens/Tabs/settings/following-followers/following_followers_screen.dart';
import 'package:untitled/screens/Tabs/settings/information-screen/information_screen.dart';
import 'package:untitled/screens/Tabs/settings/languages/languages_screen.dart';
import 'package:untitled/screens/Tabs/settings/profile-edit/profile_edit_screen.dart';
import 'package:untitled/screens/Tabs/settings/user-recipes/user_recipes_screen.dart';
import 'package:untitled/screens/address/addressScreen.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/widgets/default_custom_button.dart';
import 'package:untitled/widgets/shimmer_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


final BaseCacheManager baseCacheManager = DefaultCacheManager();

class select_service_page extends StatefulWidget {
  static const routeName = 'select_service_screen';

  @override
  _select_service_pageState createState() => _select_service_pageState();
}

class _select_service_pageState extends State<select_service_page> {
  AuthProvider? _authProvider;
var _selectedItem ="";

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_authProvider!.user != null) _authProvider!.getFollowingFollowers();
  }

  _logout() async {

    Provider.of<AuthProvider>(context, listen: false).logout();
    _navigateToLoginScreen();
  }

  _navigateToLoginScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //body: _body(),
         // appBar: _appBar(),
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
      ),
    );
  }

  _body() {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Column(
          children: <Widget>[

            SizedBox(height: 50,),
            _buildButtonsList(auth),
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
          ],
        );
      },
    );
  }

  _buildUserImage(AuthProvider auth) {
    if (auth.user != null && auth.user?.image != null) {
      return (auth.user!.image!.contains('https'))
          ? CachedNetworkImage(
              imageUrl: '${auth.user!.image}',
              imageBuilder: (context, imageProvider) => Container(
                width: 85.0,
                height: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => ShimmerWidget(
                width: 85,
                height: 85,
                circular: true,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : CachedNetworkImage(
              imageUrl: '${ApiRepository.USER_IMAGES_PATH}${auth.user!.image}',
              imageBuilder: (context, imageProvider) => Container(
                width: 85.0,
                height: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  ShimmerWidget(width: 85, height: 85, circular: true),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
    } else
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/logo_user.png'),
        radius: 40,
      );
  }

  _buildUserName(AuthProvider auth) {
    return Text(auth.user != null ? auth.user!.name! : 'Guest',
        style: GoogleFonts.ubuntu(fontSize: 20));
  }

  _buildFollowingFollowers(AuthProvider auth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonCount(
          index: 1,
          count: auth.followingUsers.length,
          text: 'following'.tr(),
        ),
        _buildButtonCount(
          index: 0,
          count: auth.followerUsers.length,
          text: 'followers'.tr(),
        ),
      ],
    );
  }

  _buildButtonCount({int? index, String? text, int? count}) {
    return GestureDetector(
      onTap: () async => await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FollowingFollowersScreen(index: index),
        ),
      ),
      child: Column(
        children: [
          Text(text!, style: GoogleFonts.ubuntu(fontSize: 16)),
          Text('$count', style: GoogleFonts.ubuntu(fontSize: 16))
        ],
      ),
    );
  }

  _buildButtonsList(auth) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                       child:
                       GestureDetector(
                         onTap:() =>Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (ctx) => LoginScreen(),
                           ),
                         ),
                         child:Container(
                           height: 40,
                           width: MediaQuery.of(context).size.width * .30,
                           decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                             color: Colors.green,
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [

                               Image.asset("assets/wsp/Login.png",),
                               SizedBox(width: 5,),
                               Text('sign_in'.tr(), style: TextStyle(fontSize: 20.0, color: Colors.white,),textAlign: TextAlign.center,),
                             ],
                           ),

                         ),
                       ),
                    ),
                  ],
                ),

                   GestureDetector(
                     onTap: (){
                       _selectedItem = 'water_supply_charges';
                       setState(() {

                       });
                     },
                     child: ( _selectedItem == 'water_supply_charges')?
                     _listViewItem(
                       context,
                         "assets/wsp/drop.png",
                       'water_supply_charges'.tr(), true
                     )
                         : _listViewItem(
                       context,
                         "assets/wsp/drop.png",
                       'water_supply_charges'.tr(),false
                     ),
                   ),


                // Divider(height: 1.5, indent: 15, endIndent: 15),
                GestureDetector(
                  onTap: (){
                    _selectedItem = 'waste_water_charges';
                    setState(() {

                    });
                  },
                  child: ( _selectedItem == 'waste_water_charges')?_listViewItem(
                      context, "assets/wsp/drop-1.png", 'waste_water_charges'.tr(),true):_listViewItem(
                      context, "assets/wsp/drop-1.png", 'waste_water_charges'.tr(),false),
                ),
                Column(
                        children: [
                    GestureDetector(
                    onTap: (){
              _selectedItem = 'rabbish_collection_charges';
              setState(() {

        });
      },
          child: ( _selectedItem == 'rabbish_collection_charges') ?_listViewItem(context, "assets/wsp/trash.png",
                                'rabbish_collection_charges'.tr(),true):
          _listViewItem(context, "assets/wsp/trash.png",
                                'rabbish_collection_charges'.tr(),false),
                          ),
         
                        ],
                      ),

                GestureDetector(
                    onTap: (){
                      _selectedItem = 'house_heating';
                      setState(() {

                      });
                    },
                    child: ( _selectedItem == 'house_heating')?
                    _listViewItem(context, "assets/wsp/home.png", 'house_heating'.tr(),true):_listViewItem(context, "assets/wsp/home.png", 'house_heating'.tr(),false),),
            GestureDetector(
              onTap: (){
                _selectedItem = 'house_rent';
                setState(() {

                });
              },
              child: ( _selectedItem == 'house_rent')?
                _listViewItem(context, "assets/wsp/home-1.png", 'house_rent'.tr(),true) : _listViewItem(context, "assets/wsp/home-1.png", 'house_rent'.tr(),false)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 70),

                  child: DefaultCustomButton(
                    text: 'next'.tr(),
                    onPressed: ()=>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => addressScreen(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _listViewItem(BuildContext context, var icon, String text,bool isselected,
      {Color? color}) {

   return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Container(
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(
                  color: (isselected)? Color(0xffdef5ec):Color(0xffedf6ff),
                  border: Border.all(
                    color:(isselected)? Colors.green: Color(0xffedf6ff),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffedf6ff),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              child: Center(
                  child: Image.asset(icon,color: Colors.green,height: 50,width: 50,)
              )
          ),
        ),
      ],

    );


    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: <Widget>[
    //       CircleAvatar(
    //         backgroundColor: Colors.white,
    //         child: Icon(icon, color: color != null ? color : Colors.black),
    //       ),
    //       SizedBox(width: 15),
    //       Text(
    //         text,
    //         style: GoogleFonts.roboto(
    //             fontSize: 15,
    //             fontWeight: FontWeight.normal,
    //             color: color != null ? color : Colors.black),
    //       ),
    //       Spacer(),
    //       Icon(
    //         Icons.arrow_forward_ios,
    //         size: 15,
    //         color: color != null ? color : Theme.of(context).iconTheme.color,
    //       ),
    //     ],
    //   ),
    // );
  }

  void _shareApp() {

  }
}
