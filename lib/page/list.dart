import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticketing/particle/baseUrl.dart';
import 'package:ticketing/particle/widhtAndHeight.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  TextEditingController _textController = TextEditingController();
  List dataList = [];
  List searchResults = [];
  List<dynamic> data = [];
  List<String> items = List.generate(20, (index) => 'Item $index');
  String? arguments;
  void initState() {
    super.initState();
    _refresh();
    verfikasi(arguments);
  }

  Future<void> verfikasi(String? arguments) async {
    final urlBase = BaseUrl().baseUrl;
    final respon = await http.get(Uri.parse("$urlBase/verfikasi/$arguments"));
    if (respon.statusCode == 200) {
      final Map<String, dynamic> list = jsonDecode(respon.body);
      data = list["cart"];
      // print(data);
    }
  }

  void searchList(String query) {
    setState(() {
      searchResults = data.where((event) {
        return event['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> _refresh() async {
    // Logika refresh di sini
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Anda dapat memperbarui data di sini jika diperlukan
      items = List.generate(20, (index) => 'Refreshed Item $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    final String arguments =
        ModalRoute.of(context)?.settings.arguments as String;
    final urlStorage = BaseUrl().sUrl;
    verfikasi(arguments);
    final lebar = Lebar();
    final width = lebar.widthDevice;
    final heigth = lebar.heightDevice;
    return Scaffold(
      appBar: AppBar(
        title: Text('List Vervikasi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 126, 126, 126),
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 0), // Shadow position
                ),
              ], color: Color.fromARGB(255, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)),
                  // padding: EdgeInsets.all(30),
                  child: TextField(
                    controller: _textController,
                    onChanged: (value) {
                      searchList(value);
                    },
                    decoration: InputDecoration(
                        labelText: "Search..",
                        icon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RefreshIndicator(
              onRefresh: _refresh,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: heigth / 1.4,
                    // padding: EdgeInsets.all(10),
                    child: FutureBuilder(
                        future: verfikasi(arguments),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SpinKitDoubleBounce(
                              color: Colors.blue, // Atur warna animasi
                              size: 50.0, // Atur ukuran animasi
                            );
                          } else {
                            // final cart = snapshot.data?['cart'];
                            // final cart = snapshot.data;
                            // print(cart);
                            if (data.isEmpty) {
                              return Center(child: Text("Tidak Ada Data"));
                            }
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: searchResults.length > 0
                                  ? searchResults.length
                                  : data.length,
                              itemBuilder: (context, index) {
                                final datas = searchResults.length > 0
                                    ? searchResults[index]
                                    : data[index];
                                // print("sd/$dataList.length");
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.black)),
                                  child: ListTile(
                                    // contentPadding: EdgeInsets.all(10),
                                    tileColor:
                                        Color.fromARGB(255, 235, 235, 235),
                                    leading: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2.0)),
                                      child: ClipOval(
                                        child: datas['gambar'] == ''
                                            ? Image.asset(
                                                'assets/images/avatar.png')
                                            : Image.network(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                '$urlStorage/user/' +
                                                    datas["gambar"],
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    title: Text(datas["name"]),
                                    subtitle: datas['konfirmasi'] == "1"
                                        ? Text('Sudah Terverifikasi')
                                        : Text(''),
                                    trailing:
                                        Icon(Icons.check_circle_outline_sharp),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
