import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DefaultCustomButton extends StatelessWidget {
  final String? image;
  final String? text;
  final Function? onPressed;
  final double? height;


  const DefaultCustomButton({
    this.image,
    this.text,
    this.onPressed,
    this.height,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 250,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: context.locale == Locale('ar', 'AL') ? 10 : 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: FittedBox(
            child: Row(
              children: [

                Text(
                  text!.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 50),
                ),
              ],
            ),
          ),
          onPressed: () => onPressed!(),
        ),

      ),

    );
  }
}




