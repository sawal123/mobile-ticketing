import 'package:flutter/material.dart';
import 'package:ticketing/page/home.dart';
import 'package:ticketing/page/inputcode.dart';
import 'package:ticketing/page/login.dart';
import 'package:ticketing/page/scanbarcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // static const String inputRoute = '/input';
    return MaterialApp(
      // home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginApp(),
        '/': (context) => HomePage(),
        '/input': (context) => InputCode(),
        '/scan': (context) => QRViewExample(),
      },
    );
  }
}
