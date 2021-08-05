//SHA1 - A3:78:75:4C:63:E8:49:BB:40:26:C0:C7:12:41:1D:87:69:C9:4B:67

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('on Background Handler ${message.messageId}');

    _messageStream.add(message.notification?.title ?? 'No tittle');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('on Message Handler ${message.messageId}');

    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('on Message open app Handler ${message.messageId}');

    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Handler
    //FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //local notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
