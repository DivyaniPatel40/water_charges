import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/checkbox_list_tile.dart';
import 'package:untitled/widgets/steps_list_tile.dart';

// Convert minutes into hours
String getDuration(String value) {
  if (int.parse(value) > 60) {
    final int hour = int.parse(value) ~/ 60;
    final int minutes = int.parse(value) % 60;
    if (minutes != 0)
      return '${hour.toString().padLeft(2)}h ${minutes.toString().padLeft(2, "0")}m';
    else
      return '${hour.toString().padLeft(2)}h';
  } else {
    return '$value min';
  }
}

bool valdiateURL(String url) {
  bool valid = false;
  if (url.contains('http://') || url.contains('https://'))
    valid = true;
  else
    valid = false;
  return valid;
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

Widget swipeToRefresh(context,
    {Widget? child,
    refreshController,
    VoidCallback? onRefresh,
    VoidCallback? onLoading}) {
  return Container();
}

showAlertDialog(
  BuildContext context, {
  String title = '',
  String description = '',
  required Function onPressed,
}) {
  // Alert(
  //   context: context,
  //   title: title,
  //   desc: description,
  //   onWillPopActive: true,
  //   buttons: [
  //     DialogButton(
  //       child: Text(
  //         "Retry",
  //         style: TextStyle(color: Colors.white, fontSize: 20),
  //       ),
  //       onPressed: () => onPressed(),
  //       color: Theme.of(context).primaryColor,
  //       radius: BorderRadius.circular(10.0),
  //     ),
  //   ],
  // ).show();
}

showPreviewDialog(BuildContext context, String label, List<String> list) {
  showDialog(
    useSafeArea: true,
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10),
      title: Text(
        label == 'steps'.tr()
            ? 'steps_preview'.tr()
            : 'ingredients_preview'.tr(),
        style: TextStyle(fontSize: 16),
      ),
      content: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) => (label == 'steps'.tr())
              ? StepsListTile(context: context, index: index, items: list)
              : CheckBoxListTile(context: context, index: index, items: list),
          itemCount: list.length,
        ),
      ),
    ),
  );
}

Future showCustomDialogWithTitle(
  BuildContext context, {
  String title = '',
  Widget? body,
  Function? onTapSubmit,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != '' ? Text(title) : Container(),
        content: SingleChildScrollView(child: body),
        actions: <Widget>[
          onTapSubmit != null
              ? TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text('submit'.tr(),
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => onTapSubmit(),
                )
              : Container(),
        ],
      );
    },
  );
}
