import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'appColors.dart';

class LoginValidationSplashScreen extends StatefulWidget {
  @override
  _LoginValidationSplashScreenState createState() {
    return _LoginValidationSplashScreenState();
  }
}

class _LoginValidationSplashScreenState
    extends State<LoginValidationSplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bg_white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/loader_4balls.json"),
            ),
            Center(
              child: TweenAnimationBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  return Text(
                    "Iniciando sesión".substring(0, value),
                    style: TextStyle(decoration: TextDecoration.none),
                  );
                },
                duration: Duration(milliseconds: 1200),
                tween: IntTween(begin: 0, end: "Iniciando sesión".length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
