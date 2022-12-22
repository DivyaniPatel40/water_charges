//searchphoneaddress

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/utils/bubble_indication_painter.dart';
import 'package:untitled/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/widgets/custom_text_field.dart';
import 'package:untitled/widgets/progress_dialog.dart';

import '../../models/api_models/customer_details_model.dart';
import '../../theme.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/default_custom_button.dart';
import '../../widgets/size_constants.dart';
import 'dart:developer';

import '../Paymrnt/payment_details.dart';
// import 'package:untitled/models/city_listModel.dart';


class searchphoneaddress extends StatefulWidget {

  @override
  _searchphoneaddressState createState() => new _searchphoneaddressState();
}

class _searchphoneaddressState extends State<searchphoneaddress> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
  new TextEditingController();

   PageController _pageController = new PageController();

  Color left = Colors.black;
  Color right = Colors.black;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: Stack(
          children: [
             Positioned.fill(
              child: Image.asset(
                "assets/wsp/Group 42.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            // Positioned.fill(
            //   child: Image.asset(
            //     "assets/wsp/background.png",
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.bottomLeft,
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height >= 775.0
                  ? MediaQuery.of(context).size.height
                  : 775.0,
              decoration: new BoxDecoration(

              ),
              child: Column(

                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 80,),

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
                            child: Image.asset("assets/wsp/drop.png",color: Colors.green,height: 50,width: 50,)
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(tr("water_supply_charges"),style: TextStyle(color: Colors.white),),
                  SizedBox(height: 80,),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: _buildMenuBar(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        if (i == 0) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.black;

                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.black;
                          });
                        }
                      },
                      children: <Widget>[
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: _buildSignIn(context),
                        ),
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: _buildSignUp(context),
                        ),



                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),



      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //GetWaterchargeAPICall();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _getCityList();
    _pageController = PageController();
  }
  List<DropdownMenuItem<String>> a=[];

  var area,address,building,appartment ;
  Future<void> _getCityList() async {
    await ApiRepository.getcityarealist().then((value) {
      print("valuessss ${value.data}");
     area = value.data;
      countryname = area[0].cityNameTm;
      // a.add(area);
      // a = area;
      // print(value);

      setState(() {
        // _likes = value!;
      });
    });
  }
  Future<void> _getAddressList() async {
    await ApiRepository.getaddresslist().then((value) {
      print("valuessss ${value.data}");
     address = value.data;
      addressname = address[0].streetNameNew;
      // a.add(area);
      // print(value);
      setState(() {
        // _likes = value!;
      });
    });
  }
  Future<void> _getBuildingList() async {
    await ApiRepository.getbuildinglist().then((value) {
      print("valuessss ${value.data}");
      building = value.data;
      buildingname = building[0].buildingNo;
      // a.add(area);
      // print(value);
      setState(() {
        // _likes = value!;
      });
    });
  }
  Future<void> _getappartmentList() async {
    await ApiRepository.getappartmentlist().then((value) {
      print("valuessss ${value.data}");
      appartment = value.data;
      appartmentName = appartment[0].apartmentNo;
      // a.add(area);
      // print(value);
      setState(() {
        // _likes = value!;
      });
    });
  }





var addressname,buildingname,appartmentName;
  String? countryname;
  void showInSnackBar(String value) {

  }
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  Widget phoneNumberInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child:     Card(
      elevation: 1,
      color:  Color(0xffedf6ff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Color(0xffedf6ff)),
      ),
      child: TextFormField(

        controller: phoneNumberController,
        obscureText: false,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Raleway',
          fontSize: 14,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 0),
          errorStyle: TextStyle(fontSize: 10, height: 0.4),
          // contentPadding: EdgeInsets.symmetric(vertical: 1),
          focusedErrorBorder: InputBorder.none,
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          errorBorder: InputBorder.none,
          labelText: "Phone No",
          labelStyle: TextStyle(
            color: Color(0xff9ed5ff),
            fontFamily: 'Raleway',
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '"text" ' + 'cannot_be_empty'.tr();
          }
          return null;
        },
      ),
    )

    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xfff1fff9),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child:
        TextButton(

                onPressed: _onSignInButtonPress,
                child: Text(
                  "by_phone".tr(),
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(

                onPressed: _onSignUpButtonPress,
                child: Text(
                  "by_address".tr(),
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  TextEditingController _accountNoController = TextEditingController();
  final formKey = new GlobalKey<FormState>();

  Widget _buildSignIn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(top: 23.0),
        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  tr('phone_no'),
                  style: GoogleFonts.ubuntu(fontSize: 14),
                ),
              ),
              phoneNumberInput(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  tr('acc_no'),
                  style: GoogleFonts.ubuntu(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  text: 'acc_no_enter'.tr(),
                  icon: Icon(Icons.lock, color: Colors.green),
                  obscure: true,
                  controller: _accountNoController,
                ),
              ),
      SizedBox(height: 50,),
      Center(
          child: DefaultCustomButton(
            text: "SEND",
            onPressed: (){
              if (formKey.currentState!.validate()) {
                if (phoneNumberController.text.isNotEmpty && _accountNoController.text.isNotEmpty ) {


                  GetWaterchargeAPICall();

                } else {
                  Fluttertoast.showToast(
                    msg: 'error'.tr(),
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
              }
            },
          ),),
            ],
          ),
        ),
      ),
    );
  }
  GetWaterchargeAPICall() async {

    await loadingDialog(context).show();


    await ApiRepository.getchargebyPhoneNo(
        context,
        _accountNoController.value.text,
        phoneNumberController.value.text

    ).then((value) async {
      await loadingDialog(context).hide();
       if (value != null) {
         print("asdasdfva${value}");
         final body = json.decode(value.body);
         print("bodysfddsfdxf${body['data']}");
         var myData = CustomerDetailsModel.fromJson(body);
         print("mydta is${myData}");
         Navigator.push(context, MaterialPageRoute(builder: (context) =>
             payment_details(customerDetailsData: myData.data)));
       }
    });

    FocusScope.of(context).unfocus();
    // Navigator.pop(context);

  }


  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              // overflow: Overflow.visible,
              children: <Widget>[
                Container(

                  padding: EdgeInsets.only(left: 20,right: 20),
                  //width: 300.0,

                  child: ListView(
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text("Select an area",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        (area == null)? Custom_Dropdown(dropdownlist:  ["Select an area"], hintText: "Select an area",):
                        Container(
                          padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colorss.textfiledbackground,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<dynamic>(
                              hint: Text("Select an area",
                                  style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12)),
                                borderRadius: BorderRadius.circular(30),
                                icon: Image.asset("assets/images/ic_dropdown.png",height: 7.5,width: 15.5,),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: countryname,
                                items: area
                                    .map<DropdownMenuItem<dynamic>>(
                                      ( data) =>
                                      DropdownMenuItem<dynamic>(

                                        child: Text("${data.cityNameTm}",style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),),
                                        value: data.cityNameTm,
                                      ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                  _getAddressList();
                                  setState(() {
                                      countryname = value;
                                  });
                                }
                                ),
                          ),
                        ),

                        height20SizedBox,
                        Text("Select a street",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        (address == null)?Custom_Dropdown(dropdownlist: ["Please First Select a area"], hintText: "Select a street",):

                        Container(
                          padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colorss.textfiledbackground,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<dynamic>(
                                borderRadius: BorderRadius.circular(30),
                                icon: Image.asset("assets/images/ic_dropdown.png",height: 7.5,width: 15.5,),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: addressname,
                                items: address
                                    .map<DropdownMenuItem<dynamic>>(
                                      ( data) =>
                                          DropdownMenuItem<dynamic>(
                                    child: Text("${data.streetNameNew}",style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),),
                                    value: data.streetNameNew,
                                  ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                  _getBuildingList();
                                  setState(() {
                                    // countryname = value;
                                  });
                                }),
                          ),
                        ),
                        height20SizedBox,
                        Text("Select a building",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        (building == null)?Custom_Dropdown(dropdownlist: ["Please First Select a street"], hintText: "Select a building",):

                        Container(
                          padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colorss.textfiledbackground,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<dynamic>(
                                borderRadius: BorderRadius.circular(30),
                                icon: Image.asset("assets/images/ic_dropdown.png",height: 7.5,width: 15.5,),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: buildingname,
                                items: building
                                    .map<DropdownMenuItem<dynamic>>(
                                      ( data) =>
                                      DropdownMenuItem<dynamic>(

                                        child: Text("${data.buildingNo}",style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),),
                                        value: data.buildingNo,
                                      ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                  _getappartmentList();
                                  // setState(() {
                                  //   countryname = value;
                                  // });
                                }),
                          ),
                        ),
                        height20SizedBox,
                          Text("Select a property (Apartment)",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        (appartment == null)?Custom_Dropdown(dropdownlist: ["Please First Select a building"], hintText: "Select a property (Apartment)",):

                        Container(
                          padding: EdgeInsets.fromLTRB(17, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colorss.textfiledbackground,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<dynamic>(
                                borderRadius: BorderRadius.circular(30),
                                icon: Image.asset("assets/images/ic_dropdown.png",height: 7.5,width: 15.5,),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: appartmentName,
                                items: appartment
                                    .map<DropdownMenuItem<dynamic>>(
                                      ( data) =>
                                      DropdownMenuItem<dynamic>(
                                        child: Text("${data.apartmentNo}",style: const TextStyle(color: Colorss.textColorBlue,fontSize: 12),),
                                        value: data.apartmentNo,
                                      ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                //  _getappartmentList();
                                  // setState(() {
                                  //   countryname = value;
                                  // });
                                }),
                          ),
                        ),
                        height20SizedBox,
                        Text("Account Number",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        CustomTextField(
                          text: 'acc_no_enter'.tr(),
                          icon: Icon(Icons.lock, color: Colors.green),
                          obscure: true,
                          controller:_accountNoController,
                        ),
                        height20SizedBox,
                        Center(
                          child: DefaultCustomButton(
                            text: "SEND",
                            onPressed: (){},
                          ),),
                        height50SizedBox,

                      ],
                    ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}

