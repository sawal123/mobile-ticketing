import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing/model/slide.dart';

class Repository {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Slide>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        List<dynamic> jsonDataList = json.decode(response.body);
        List<Slide> slideList =
            jsonDataList.map((e) => Slide.fromJson(e)).toList();

        return slideList;
      } else {
        throw Exception('Gagal mengambil data slide');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('Terjadi kesalahan');
    }
  }
}
