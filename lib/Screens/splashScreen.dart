import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // tiempo de carga de la pantalla splash
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'splash2');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String titulo = "Help Desk";

    return Container(
      color: bg_white,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset("assets/robot.json"),
          ),
          SizedBox(
            height: 20,
          ),
          TweenAnimationBuilder<int>(
            builder: (BuildContext context, Object value, Widget child) {
              return Text(
                titulo.substring(0, value),
                style: TextStyle(decoration: TextDecoration.none),
              );
            },
            duration: Duration(milliseconds: 1200),
            tween: IntTween(begin: 0, end: titulo.length),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "by Raci TI",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
