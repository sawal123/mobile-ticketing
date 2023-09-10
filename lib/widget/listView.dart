// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ListApp extends StatefulWidget {
  const ListApp({super.key});

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      var myResponse =
          await http.get(Uri.parse("https://rmemanagement.online/api/slide"));
      // print(myResponse.body);
      if (myResponse.statusCode == 200) {
        final dynamic dataRespon = jsonDecode(myResponse.body);
        if (dataRespon is Map<dynamic, dynamic>) {
          // Anda dapat mengakses data di dalam objek Map sesuai kebutuhan.
          final slideData =
              dataRespon['slide']; // Contoh mengakses data 'slide'
          setState(() {
            data = slideData; // Atur data sesuai kebutuhan Anda
          });
        } else {
          print('Response is not a Map');
        }
      } else {
        print('Error: ${myResponse.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final widhtDevice = MediaQuery.of(context).size.width;
    final heighDevice = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widhtDevice / 1.1,
          height: 150,
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshoot) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final dataSlide = data[index];
                      return Container(
                          margin: EdgeInsets.only(right: 5),
                          height: heighDevice,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 6, 139, 183),
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(dataSlide['gambar'])));
                    });
              }),
        ),
      ],
    );
  }
}
