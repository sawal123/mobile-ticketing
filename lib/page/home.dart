import 'package:flutter/material.dart';
import 'package:ticketing/particle/baseUrl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final apiService = ApiService();
  List<String> items = List.generate(20, (index) => 'Item $index');
  List data = [];
  String myname = '';
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final name = prefs.getString('name');
    // print(name);
    var urlBase = BaseUrl().baseUrl;
    await Future.delayed(Duration(seconds: 2));
    try {
      var myResponse = await http.get(Uri.parse("$urlBase/slide"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      // print(myResponse.body);
      if (myResponse.statusCode == 200) {
        final dynamic dataRespon = jsonDecode(myResponse.body);
        if (dataRespon is Map<dynamic, dynamic>) {
          final slideData = dataRespon['slide'];
          setState(() {
            data = slideData;
            myname = name!;
            
          });
        } else {
          print('Response is not a Map');
        }
      } else {
        print('Error: ${myResponse.statusCode}');
      }
    } catch (e) {
      print('Errors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final widhtDevice = MediaQuery.of(context).size.width;
    final heighDevice = MediaQuery.of(context).size.height;
    var urlStorage = BaseUrl().sUrl;

    // print(apiService);
    return Scaffold(
      body: RefreshIndicator(
        displacement: 50,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        color: const Color.fromARGB(255, 255, 255, 255),
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        // onRefresh: _refresh,
        onRefresh: getData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'assets/images/avatar.png',
                      width: 50,
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Text('Hi, Selamat Datang'),
                        // Padding(padding: EdgeInsets.only(top: 8.0)),
                        Text(
                          '$myname',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppinm'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Icon(Icons.logout),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //  ======================================
                // ListApp(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widhtDevice / 1.1,
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final dataSlide = data[index];
                          // print(dataSlide);
                          return Container(
                              margin: EdgeInsets.only(right: 5),
                              height: heighDevice,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 6, 139, 183),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '$urlStorage/slide/' + dataSlide['gambar'],
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      );
                                    }
                                  },
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
                // =========================================
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   width: widhtDevice,
                //   height: 100,
                //   decoration: BoxDecoration(
                //       color: Color.fromARGB(255, 234, 5, 55),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Image(
                //       image: NetworkImage(
                //           // '$storage/cover/EIKtsB1B850TG3el_1694190840_880cac8eeb54a5e128c3887292464f66c371c97b.png.webp'),
                //           '$storage/cover/_1693572896_880cac8eeb54a5e128c3887292464f66c371c97b.png.webp'),
                //       width: widhtDevice,
                //       height: heighDevice,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),

                // Image.network('/assets/slide1.jpg'),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/events');
                      },
                      child: Card(
                        child: ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                'assets/images/list.png',
                                width: 40,
                              )), // Ikon di sebelah kiri teks
                          title: const Text('LIST PESERTA'),
                          subtitle:
                              const Text('Peserta Yang Sudah Di Verifikasi'),
                          trailing: const Icon(Icons
                              .arrow_forward), // Ikon di sebelah kanan teks
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/scan');
                        },
                        child: Container(
                          // alignment: Alignment.center,
                          width: widhtDevice / 3,
                          // height: heighDevice / 5,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(230, 231, 231, 231),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: AssetImage('assets/images/scan.png'),
                                width: widhtDevice / 7,
                              ),
                              const Text(
                                'Scan Barcode',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/input');
                        },
                        child: Container(
                          width: widhtDevice / 3,
                          // height: heighDevice / 5,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(230, 230, 230, 230),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: AssetImage('assets/images/input.png'),
                                width: widhtDevice / 7,
                              ),
                              Text(
                                'Input Code',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
