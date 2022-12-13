import 'package:flutter/material.dart';
import 'package:untitled/widgets/size_constants.dart';

class Loader_screen extends StatefulWidget {
  const Loader_screen({Key? key}) : super(key: key);

  @override
  State<Loader_screen> createState() => _Loader_screenState();
}

class _Loader_screenState extends State<Loader_screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(child: FittedBox(fit: BoxFit.cover,child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/wsp/loader-bg.png"),
        ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Center(
            child: Image.asset('assets/wsp/loader.png'),
          ),
        ),
      ],
    );
  }

}

bool _isShowing = false;
bool _barrierDismissible = true, _showLogs = false;

double _borderRadius = 8.0;
Color _backgroundColor = Colors.transparent;
Curve _insetAnimCurve = Curves.easeInOut;



class ProgressDialog {
  late Loader_screen _dialog;
  ProgressDialog({  bool isDismissible = true,  bool showLogs = false}) {
    _barrierDismissible = true;
    _showLogs = showLogs ;
  }

  bool isShowing() {
    return _isShowing;
  }



  Future<bool> dismiss(context) {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.pop(context);
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show(context) {
    if (!_isShowing) {
      _dialog = new Loader_screen();
      _isShowing = true;
      if (_showLogs) debugPrint('ProgressDialog shown');
      showDialog(
          context: context,
          builder: (BuildContext context){
            return  Material(
              type: MaterialType.transparency,
              child: WillPopScope(
                onWillPop: () {
                  return Future.value(_barrierDismissible);
                },
                child: Dialog(
                    backgroundColor: _backgroundColor,
                    insetAnimationCurve: _insetAnimCurve,
                    insetAnimationDuration: Duration(milliseconds: 100),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(_borderRadius))),
                    child: _dialog),
              ),
            );
          }
      );
    }else {
      if (_showLogs) debugPrint("ProgressDialog already shown/showing");
    }
  }
}
