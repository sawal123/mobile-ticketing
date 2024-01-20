import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // Move SharedPreferences logic inside a function
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // final name = prefs.getString('name');
    print(token);

    Timer(
      const Duration(seconds: 2),
      () {
        // Check if the token is present
        if (token != null) {
          // If token is present, navigate to the home page
          Navigator.pushReplacementNamed(context, '/');
        } else {
          // If token is not present, navigate to the login page
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: screenWidth * 0.5, // 50% dari lebar perangkat
          fit: BoxFit.contain,
        ), // Ganti dengan path gambar splash
      ),
    );
  }
}
