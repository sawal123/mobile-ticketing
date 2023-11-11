import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
          seconds:
              2), // Sesuaikan dengan durasi tampilan splash yang diinginkan
      () {
        Navigator.pushReplacementNamed(
            context, '/login'); // Ganti dengan rute utama aplikasi
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
