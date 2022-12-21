import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/config/app_config.dart';
import 'package:untitled/models/app_user.dart';
import 'package:untitled/preferences/session_manager.dart';
import 'package:untitled/providers/app_provider.dart';
import 'package:untitled/providers/auth_provider.dart';
import 'package:untitled/screens/Paymrnt/payment_responce.dart';
import 'package:untitled/screens/Tabs/settings/languages/languages_screen.dart';
import 'package:untitled/screens/Tabs/tabs_screen.dart';
import 'package:untitled/screens/searchphoneaddress/searchphoneaddress.dart';
import 'package:untitled/services/api_repository.dart';
import 'package:untitled/size_config.dart';
import 'package:untitled/theme.dart';
import 'package:untitled/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/size_constants.dart';
import 'package:video_player/video_player.dart';

import '../../Loader_screen/loader_screen.dart';
import '../../Other/profile/profile_screen.dart';
import '../../Paymrnt/payment_details.dart';
import '../../address/addressScreen.dart';
import '../login/login_screen.dart';
import '../login/newpassword_screen.dart';
import '../login/otp_screen.dart';
import '../login/reset_password_screen.dart';
import '../register/register_screen.dart';

// FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SessionManager prefs = SessionManager();
  AppProvider? application;
  bool _isRetrieving = true;
  bool _tryAgain = false;
  // final storage = new FlutterSecureStorage();
  VideoPlayerController? _controller;
  bool _visible = false;



  @override
  void initState() {
    super.initState();

    application = Provider.of<AppProvider>(context, listen: false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/wsp/splashvideo.mp4");
    _controller?.initialize().then((_) {
      _controller?.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller?.play();

          _visible = true;
        });
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      _checkWifi();
    });


  }


  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller?.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity:  0.9 ,
      duration: Duration(milliseconds: 100),
      child:  SizedBox.expand(child: FittedBox(fit: BoxFit.cover,child: SizedBox(
        height: 500,
        width: MediaQuery.of(context).size.width,child: VideoPlayer(_controller!)))),

        //child: VideoPlayer(_controller!)


    );
  }

  _checkWifi() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    bool connectedToWifi = (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile);
    if (!connectedToWifi) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showAlertDialog(
          context,
          title: 'No Internet Connection',
          description: 'Please Check Internet Connection',
          onPressed: () {
            Navigator.pop(context);
            _checkWifi();
          },
        ),
      );
    } else {
      _retrieveData();
    }
    if (_tryAgain != !connectedToWifi) {
      setState(() => _tryAgain = !connectedToWifi);
    }
  }

  Future _retrieveData() async {

    // await Provider.of<AppProvider>(context, listen: false).fetchSettings();
    // await Provider.of<AppProvider>(context, listen: false).fetchLanguages();
    // await Provider.of<AuthProvider>(context, listen: false).autoLogin();
    //
    setState(() {
      _isRetrieving = false;
      _controller?.dispose();
      _controller = null;
    });

  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    // _firebaseMessaging.getToken().then((token) {
    //   print('Token: $token');
    //   ApiRepository.addDevice(token!);
    // });
    //
    // FirebaseMessaging.onMessage.listen((message) {
    //   print('onMessage: $message');
    // });
    //
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   print('onMessageOpenedApp: $message');
    // });
  }

  void iOSPermission() {
    // _firebaseMessaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
  }

  Widget _loadingLayout(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            // Container(
            //   child: Image.asset(
            //     'assets/images/logo.jpg',
            //
            //     : double.infinity,
            //     height: double.infinity,
            //     fit: BoxFit.cover,
            //   ),
            //   width: double.infinity,
            //   height: double.infinity,\
            // ),

            _getVideoBackground(),


            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/wsp/logo.png",height: 150,width: 150,),
                    height10SizedBox,
                    Text("Aşgabat Şäher Hakimligi",style: TextStyle(fontSize: 18,color: Color(0xff0C76DF)),),
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  _body() {
    return _isRetrieving ?  _loadingLayout(context) : searchphoneaddress();//LanguagesScreen();
    //TabsScreen();
  }
}
