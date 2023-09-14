import 'package:flutter/widgets.dart';

class Lebar {
  double widthDevice = 0;
  double heightDevice = 0;

  Lebar._privateConstructor() {
    // Dapatkan lebar dan tinggi perangkat secara dinamis menggunakan MediaQuery
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    widthDevice = mediaQueryData.size.width;
    heightDevice = mediaQueryData.size.height;
  }

  static final Lebar _instance = Lebar._privateConstructor();

  factory Lebar() {
    return _instance;
  }
}
