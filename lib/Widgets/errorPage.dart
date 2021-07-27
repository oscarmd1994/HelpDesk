import 'package:app_soporte/Screens/appColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_soporte/Screens/appStrings.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(child: Lottie.asset("assets/error.json")),
          ),
          Expanded(
            child: Center(
              child: Text(
                errorText!,
                style: TextStyle(
                  color: bg_rojo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.height * .02),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .10,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Actualizar',
                style: TextStyle(
                  color: bg_white,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: bg_rojo,
                onPrimary: bg_dark,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
