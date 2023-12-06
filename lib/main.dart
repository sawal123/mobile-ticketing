import 'package:flutter/material.dart';
import 'package:Gotik/page/event.dart';
import 'package:Gotik/page/home.dart';
import 'package:Gotik/page/inputcode.dart';
import 'package:Gotik/page/list.dart';
import 'package:Gotik/page/login.dart';
import 'package:Gotik/page/scanbarcode.dart';
import 'package:Gotik/page/confirm.dart';
import 'package:Gotik/page/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // static const String inputRoute = '/input';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginApp(),
        '/': (context) => HomePage(),
        '/input': (context) => InputCode(),
        '/scan': (context) => QRViewExample(),
        '/confirm': (context) => MyConfirm(),
        '/list': (context) => MyList(),
        '/events': (context) => MyEvent(),
      },
    );
  }
}
