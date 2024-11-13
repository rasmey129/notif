import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'firebase_options.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('Background message received: ${message.notification?.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(MessagingApp());
}

class MessagingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Messaging',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Firebase Messaging'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging messaging;
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;

    messaging.subscribeToTopic("messaging");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.body}");

      String type = message.data['type'] ?? 'regular';
      String? imageUrl = message.notification?.android?.imageUrl;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              type == 'important' ? "Important Notification" : "Notification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: type == 'important' ? Colors.red : Colors.black,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.notification?.body ?? "No message body",
                  style: TextStyle(
                    color: type == 'important' ? Colors.red : Colors.black,
                    fontWeight: type == 'important' ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (imageUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.network(imageUrl),
                  ),
              ],
            ),
            actions: [
              TextButton(
                child: Text(
                  "Ok",
                  style: TextStyle(color: type == 'important' ? Colors.red : Colors.black),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Firebase Messaging')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Messaging Tutorial"),
          ],
        ),
      ),
    );
  }
}
