import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/theme.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String? hintText;
  //final String lable;
  final Icon? icon;
  final bool? obscure;
  final TextEditingController controller;

  const CustomTextField({
    required this.text,
    //this.lable,
    this.icon,
    this.obscure = false,
    required this.controller,
    this.hintText,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colorss.textfiledbackground,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure != null ? obscure! : false,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colorss.textColorBlue,
          fontFamily: 'Raleway',
          fontSize: 14,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 18),
          errorStyle: TextStyle(fontSize: 10, height: 0.4),
          // contentPadding: EdgeInsets.symmetric(vertical: 1),

          focusedErrorBorder: InputBorder.none,

          // focusedBorder:
          //     OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
           border: InputBorder.none,/*OutlineInputBorder(borderRadius: BorderRadius.circular(50)),*/
          // errorBorder: InputBorder.none,
          labelText: text,

          hintText: hintText,
          hintStyle: TextStyle(
            color: Colorss.textColorBlue,
          ),
          labelStyle: TextStyle(
            color: Color(0xff9ed5ff),
            fontFamily: 'Raleway',
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$text ' + 'cannot_be_empty'.tr();
          }
          return null;
        },
      ),
    );
  }
}
