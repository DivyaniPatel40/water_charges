import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/config/app_config.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

ThemeData theme() {
  return ThemeData(
    primarySwatch: AppConfig.primaryColor,
    primaryColor: AppConfig.primaryColor,
    // accentColor: Colors.lightGreen,
    canvasColor: Colors.white,
    fontFamily: 'Raleway',
    textTheme: textTheme(),
    bottomSheetTheme: bottomSheetTheme(),
  );
}

TextTheme textTheme() {
  return ThemeData.light().primaryTextTheme.copyWith(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyText2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: TextStyle(
          color: Colors.black54,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      );
}

BottomSheetThemeData bottomSheetTheme() {
  return BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  );
}


class Colorss {

  const Colorss();

  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color loginGradientEnd = const Color(0xFFf7418c);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}