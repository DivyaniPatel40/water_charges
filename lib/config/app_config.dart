import 'package:flutter/material.dart';

class AppConfig {
  ////////////////////////////////////////
  //       SERVER CONFIGURATION         //
  ////////////////////////////////////////

  // Host URL (Replace it with your host)
  // Do not add "/" at the end
  static const URL = 'http://93.171.220.230';
  // static const URL = 'http://10.0.2.2:8000';
  // static const URL = 'http://127.0.0.1:8000';

  ////////////////////////////////////////
  //           SPLASH SCREEN            //
  ////////////////////////////////////////

  static const AppName = 'Water Service Portal';

  ////////////////////////////////////////
  //         APP CONFIGURATION          //
  ////////////////////////////////////////

  // pagination settings
  // the number of recipes to load per page
  static const PerPage = 20;

  // set the ads state, set it to false if you want to hide ads
  static const AdmobEnabled = false;

  // enabled or disabled terms and conditions page in settings
  static const TermsAndConditionsEnabled = true;

  // the primary theme color, change it to your prefered color, by default it is green
  static const primaryColor = Colors.green;

  ////////////////////////////////////////
  //          APP IDENTIFIERS           //
  ////////////////////////////////////////

  // Used to enable the rating feature of the application

  // Google Play package name
  static const GooglePlayIdentifier =
      ''; //example: com.companyname.appname

  // AppStore identifier
  static const AppStoreIdentifier = ''; // example: 1491556149

  ////////////////////////////////////////
  //               ADMOB                //
  ////////////////////////////////////////

  // Admob App Id (Replace this id with your admob app id)
  static const AppId = '';

  // Admob Banner Ad Unit Id (Replace this id with your admob banner ad unit id)
  static const bannerAdUnitId = '';

  // Admob Interstitial Ad Unit Id (Replace this id with your admob interstitial ad unit id)
  static const interstitialAdUnitId = '';

  ////////////////////////////////////////
  //             APP SHARING            //
  ////////////////////////////////////////

  // Title and text that appear when sharing a recipe
  static const sharingRecipeTitle = 'Water Service Portal';
  static const sharingRecipeText =
      'Download Food Recipes app for FREE to check out more healthy meal!';

  // Title and text that appear when sharing the application
  static const sharingAppTitle = 'Water Service Portal ';
  static const sharingAppText =
      '';
  static const sharingAppGoogleLink =
      "";
  static const sharingAppAppleLink =
      "";
}
