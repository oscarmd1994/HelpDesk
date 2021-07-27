import 'package:app_soporte/notificationServices/pushNotificationServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/menuNavigationBarScreen.dart';
import 'Screens/splashScreen.dart';
import 'Screens/loginAdminScreen.dart';
import 'Screens/splashScreen2.dart';
import 'Screens/splashScreen3.dart';
import 'Screens/loginValidationSplashScreen.dart';
import 'Widgets/DetallesTicket_cola.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

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
        'login': (_) => LoginScreenAdmin(),
        'splash1': (_) => SplashScreen(),
        'splash2': (_) => SplashScreen2(),
        'splash3': (_) => SplashScreen3(),
        'home': (_) => MenuNavigationBarScreen(),
        //'homeAdmin': (BuildContext context) => MenuNavigationAdminBarScreen(),
        'wait': (_) => LoginValidationSplashScreen(),
        'ticketDC': (_) => DetallesTicketCola(),
      },
    );
  }
}
