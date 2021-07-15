import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/menuNavigationBarScreen.dart';
import 'Screens/splashScreen.dart';
import 'Screens/loginAdminScreen.dart';
import 'Screens/splashScreen2.dart';
import 'Screens/splashScreen3.dart';
import 'Screens/loginValidationSplashScreen.dart';
import 'Widgets/DetallesTicket_cola.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        'login': (BuildContext context) => LoginScreenAdmin(),
        'splash1': (BuildContext context) => SplashScreen(),
        'splash2': (BuildContext context) => SplashScreen2(),
        'splash3': (BuildContext context) => SplashScreen3(),
        'home': (BuildContext context) => MenuNavigationBarScreen(),
        'homeAdmin': (BuildContext context) => MenuNavigationBarScreen(),
        'wait': (BuildContext context) => LoginValidationSplashScreen(),
        'ticketDC': (BuildContext context) => DetallesTicketCola(),
      },
    );
  }
}
