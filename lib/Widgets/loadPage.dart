import 'package:app_soporte/Screens/appColors.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg_white,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(bg_dfondo),
            strokeWidth: 7,
          ),
        ),
      ),
    );
  }
}
