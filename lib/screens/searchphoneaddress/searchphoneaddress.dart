//searchphoneaddress

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/utils/bubble_indication_painter.dart';
import 'package:untitled/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled/widgets/custom_text_field.dart';

import '../../widgets/custom_dropdown.dart';
import '../../widgets/default_custom_button.dart';
import '../../widgets/size_constants.dart';

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
                "assets/wsp/background_full.png",
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
            SingleChildScrollView(
              child: Container(
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

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

        controller: _loginPasswordController,
        obscureText: false,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Color(0xffedf6ff),
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
  TextEditingController _loginPasswordController = TextEditingController();

  Widget _buildSignIn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(top: 23.0),
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
                controller: _loginPasswordController,
              ),
            ),
      SizedBox(height: 50,),
      Center(
        child: DefaultCustomButton(
          text: "SEND",
          onPressed: (){},
        ),),
          ],
        ),
      ),
    );
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
                        Custom_Dropdown(dropdownlist: ["one","adsf"], hintText: "sdjkbds",),
                        height20SizedBox,
                        Text("Select a street",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        Custom_Dropdown(dropdownlist: ["one","adsf"], hintText: "sdjkbds",),
                        height20SizedBox,
                        Text("Select a building",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        Custom_Dropdown(dropdownlist: ["one","adsf"], hintText: "sdjkbds",),
                        height20SizedBox,
                        Text("Select a property (Apartment)",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        Custom_Dropdown(dropdownlist: ["one","adsf"], hintText: "sdjkbds",),
                        height20SizedBox,
                        Text("Account Number",style: TextStyle(fontSize: 12),),
                        height10SizedBox,
                        CustomTextField(
                          text: 'acc_no_enter'.tr(),
                          icon: Icon(Icons.lock, color: Colors.green),
                          obscure: true,
                          controller: _loginPasswordController,
                        ),
                        height20SizedBox,
                        Center(
                          child: DefaultCustomButton(
                            text: "SEND",
                            onPressed: (){},
                          ),),

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

