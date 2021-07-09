import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    // tiempo de carga de la pantalla splash
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'splash3');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Lottie.asset("assets/loader_4balls.json"),
          ),
        ],
      ),
    );
  }
}
