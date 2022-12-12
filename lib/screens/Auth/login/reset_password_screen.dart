import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/models/app_user.dart';
import 'package:untitled/preferences/session_manager.dart';
import 'package:untitled/providers/app_provider.dart';
import 'package:untitled/providers/auth_provider.dart';
import 'package:untitled/providers/category_provider.dart';
import 'package:untitled/providers/cuisine_provider.dart';
import 'package:untitled/providers/recipe_provider.dart';
import 'package:untitled/screens/Auth/login/otp_screen.dart';
import 'package:untitled/screens/Auth/login/widgets/custom_divider.dart';
import 'package:untitled/screens/Auth/login/widgets/social_media_button.dart';
import 'package:untitled/screens/Auth/register/register_screen.dart';
import 'package:untitled/screens/Tabs/tabs_screen.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/widgets/custom_text_field.dart';
import 'package:untitled/widgets/default_custom_button.dart';
import 'package:untitled/widgets/progress_dialog.dart';
import 'package:provider/provider.dart';

class reset_password_screen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _reset_password_screenState createState() => _reset_password_screenState();
}

class _reset_password_screenState extends State<reset_password_screen> {
  TextEditingController _loginEmailController = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();
  TextEditingController _loginResetEmailController = TextEditingController();

  // final GoogleSignIn googleSignIn = new GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  SessionManager prefs = SessionManager();
  late AppProvider application;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String _deviceName;

  void initState() {
    super.initState();
    application = Provider.of<AppProvider>(context, listen: false);

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    getDeviceName();
  }

  void getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        _deviceName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        _deviceName = iosInfo.utsname.machine;
      }
    } catch (e) {
      print(e);
    }
  }

  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      body: _body(queryData),
    );
  }

  _body(MediaQueryData queryData) {
    return SingleChildScrollView(
      child: Container(
        height: queryData.size.height,
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildLoginScreen(queryData),
          ],
        ),
      ),
    );
  }

  _buildBackgroundImage() {
    return Container(
      child: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "assets/wsp/background.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),
      ]),
    );
  }

  _buildLoginScreen(MediaQueryData queryData) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(child: Column(
            children: [
              Text(tr("reset_password"),style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
              Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50,top: 7),
                child: Text(tr("enter_email_subtitle"),maxLines: 2,style: TextStyle(color: Colors.grey,fontSize: 15,),textAlign:TextAlign.center,),
              )
            ],
          )),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: queryData.size.width / 17),
            child: Column(
              children: [
                SizedBox(height: 50),
                CustomTextField(
                  text: 'id_enter'.tr(),
                  //lable: "Enter your ID",
                  icon: Icon(Icons.mail, color: Theme.of(context).primaryColor),
                  controller: _loginEmailController,
                ),
                SizedBox(height: 5),
                // CustomTextField(
                //   text: 'password'.tr(),
                //   icon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
                //   obscure: true,
                //   controller: _loginPasswordController,
                // ),
                SizedBox(height: 30),
                DefaultCustomButton(
                  text: 'send'.tr(),
                  onPressed:() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => otp_screen(),
                    ),
                  ),
                  //_signInUsingEmail,
                ),
                SizedBox(height: 25),
                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () => _showForgotPassDialog(),
                //     child: AutoSizeText(
                //       'Forget your password?'.tr(),
                //       minFontSize: 13,
                //       style: TextStyle(color: Colors.grey, fontSize: 14),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),
                // GestureDetector(
                //   onTap: () => _navigateToRegisterScreen(),
                //   child: _noAccountText(),
                // ),
                // SizedBox(height: 20),
                // Row(
                //   children: [
                //     CustomDivider(),
                //     Text('or'.tr(), style: TextStyle(fontFamily: 'Raleway')),
                //     CustomDivider(),
                //   ],
                // ),
                // // _buildSocialButtons(),
                // SizedBox(height: 20),
                // _buildLanguagesIcons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _noAccountText() {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'don\'t_have_an_account'.tr(),
            minFontSize: 13,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(width: 4),
          AutoSizeText(
            'sign_up_now'.tr(),
            minFontSize: 13,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }


  _buildLanguagesIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _languageIconButton(
          'assets/images/flag_ar.png',
              () {
            context.setLocale(Locale('ar', 'AL'));
            _emptyLists();
          },
        ),
        _languageIconButton(
          'assets/images/flag_fr.png',
              () {
            context.setLocale(Locale('fr', 'FR'));
            _emptyLists();
          },
        ),
        _languageIconButton(
          'assets/images/flag_us.png',
              () {
            context.setLocale(Locale('en', 'US'));
            _emptyLists();
          },
        ),
      ],
    );
  }

  _emptyLists() {
    Provider.of<RecipeProvider>(context, listen: false).emptyRecipeLists();
    Provider.of<CategoryProvider>(context, listen: false).emptyCategoryLists();
    Provider.of<CuisineProvider>(context, listen: false).emptyCuisineLists();
    Provider.of<AppProvider>(context, listen: false).emptyDifficultiesLists();
  }

  _languageIconButton(String image, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: SizedBox(
        width: 55,
        child: Card(
          shape: CircleBorder(side: BorderSide(width: 0, color: Colors.white)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Image.asset(image, width: 40),
          ),
        ),
      ),
    );
  }

  _navigateToRegisterScreen() async {
    await Navigator.of(context)
        .pushNamed(RegisterScreen.routeName)
        .then((value) {
      setState(() {
        FocusScope.of(context).unfocus();
      });
    });
  }

  _showForgotPassDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.only(bottom: 20),
        title: Text(
          'reset_password'.tr(),
          style: TextStyle(fontSize: 16),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Text(
                'if_you_have_forgotten'.tr(),
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomTextField(
                text: 'email'.tr(),
                icon: Icon(Icons.mail, color: Theme.of(context).primaryColor),
                obscure: false,
                controller: _loginResetEmailController,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                await ApiRepository.resetPassword(
                    _loginResetEmailController.value.text)
                    .then((value) {
                  Fluttertoast.showToast(msg: '$value');
                  if (value == 'please_check_your_email'.tr())
                    Navigator.pop(context);
                });
              },
              child: Text('reset'.tr(), style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  _navigateToTabsScreen() {
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  _signInUsingEmail() async {
    var _authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_loginEmailController.value.text.isNotEmpty &&
        _loginPasswordController.value.text.isNotEmpty) {
      await loadingDialog(context).show();

      if (EmailValidator.validate(_loginEmailController.value.text.trim())) {
        // new code
        var creds = {
          'email': _loginEmailController.text.trim(),
          'password': _loginPasswordController.text.trim(),
          'device_name': _deviceName,
        };

        bool authenticated = await _authProvider.login(creds: creds);

        await loadingDialog(context).hide();
        print(authenticated);

        if (authenticated) {
          _navigateToTabsScreen();
        }
        // _navigateToTabsScreen();
        // new code end

        // await ApiRepository.loginUser(
        //         context,
        //         _loginEmailController.value.text.trim(),
        //         _loginPasswordController.value.text.trim())
        //     .then((user) async {
        //   if (user.id != null) {
        //     prefs.saveUser(
        //       id: user.id,
        //       image: user.avatar,
        //       name: user.name,
        //       email: user.email,
        //     );
        //     application.addUserInfo(
        //       AppUser(
        //         id: user.id,
        //         avatar: user.avatar,
        //         email: user.email,
        //         name: user.name,
        //       ),
        //     );
        //     await loadingDialog(context).hide();
        //     _navigateToTabsScreen();
        //   } else {
        //     await loadingDialog(context).hide();
        //     Fluttertoast.showToast(
        //       msg: 'Wrong Email or Password!',
        //       toastLength: Toast.LENGTH_SHORT,
        //       timeInSecForIosWeb: 1,
        //     );
        //   }
        // });
      } else {
        await loadingDialog(context).hide();
        Fluttertoast.showToast(
          msg: 'invalid_email'.tr(),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
        );
      }
    } else {
      await loadingDialog(context).hide();
      Fluttertoast.showToast(
        msg: 'invalid_input'.tr(),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
      );
    }
  }

}
