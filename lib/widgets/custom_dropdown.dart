import 'package:flutter/material.dart';
import 'package:untitled/theme.dart';
class Custom_Dropdown extends StatefulWidget {
  String? dropdownvalue;
  List<String>? dropdownlist;
  String? hintText;
   Custom_Dropdown({Key? key, required this.dropdownlist, this.dropdownvalue,this.hintText}) : super(key: key);

  @override
  State<Custom_Dropdown> createState() => _Custom_DropdownState();
}

class _Custom_DropdownState extends State<Custom_Dropdown> {


  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 17,right: 20),
      padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colorss.textfiledbackground,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Image.asset("assets/images/ic_dropdown.png",height: 7.5,width: 15.5,),
          borderRadius: BorderRadius.circular(30),
          value: widget.dropdownvalue,
          hint: Text(widget.hintText ==null ? "hfhf" : widget.hintText.toString(),style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),),
            style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),

          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              widget.dropdownvalue = value!;
            });
          },
          items: widget.dropdownlist?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(

              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      )
    );
  }
}
