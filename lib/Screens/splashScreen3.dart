import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_soporte/Screens/appColors.dart';

class SplashScreen3 extends StatefulWidget {
  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    // tiempo de carga de la pantalla splash
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'login');
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "by",
              style: GoogleFonts.chango(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            width: 300,
            //child: Lottie.asset("loader_4balls.json"),
            child: Image(
              image: AssetImage("images/logo_raci_t.png"),
            ),
          ),
        ],
      ),
    );
  }
}
