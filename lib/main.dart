import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Screens/appColors.dart';
import 'notificationServices/pushNotificationServices.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late FlutterLocalNotificationsPlugin localNotification;
  @override
  void initState() {
    super.initState();

    var androidInitializable =
        new AndroidInitializationSettings('@mipmap/launcher_icon');

    var iOSInitialize = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializacionSettings = InitializationSettings(
      android: androidInitializable,
      iOS: iOSInitialize,
    );

    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializacionSettings);

    Future _showNotifications() async {
      var androidDetails = new AndroidNotificationDetails(
          "channelId",
          "Local Notification",
          "This is the description of the Notification, you can write anything",
          icon: '@mipmap/launcher_icon',
          color: Colors.white,
          importance: Importance.high);
      var iosDetails = new IOSNotificationDetails();
      var generalNotificationsDetails = new NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );
      await localNotification.show(0, 'Notif Title',
          'The Body of the Notification', generalNotificationsDetails);
    }

    PushNotificationService.messagesStream.listen((message) {
      //print('MyApp: $message');
      final snackBar = SnackBar(
        backgroundColor: bg_dark.withOpacity(0.8),
        duration: Duration(seconds: 20),
        content: Container(
          height: 50.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  CupertinoIcons.exclamationmark_circle_fill,
                  color: bg_white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: bg_white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Fernando Calixto Andon',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: bg_white),
                  ),
                  Text(
                    'No hay red en el piso 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: bg_white.withOpacity(0.8)),
                  ),
                ],
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        action: SnackBarAction(
          label: 'CERRAR',
          textColor: bg_fondo_medium_ticket,
          onPressed: () {
            scaffoldKey.currentState?.hideCurrentSnackBar();
          },
        ),
      );
      scaffoldKey.currentState?.showSnackBar(snackBar);
      _showNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
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
