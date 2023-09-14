import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:ticketing/particle/widhtAndHeight.dart';
import 'package:http/http.dart' as http;

class MyConfirm extends StatefulWidget {
  const MyConfirm({super.key});

  @override
  State<MyConfirm> createState() => _MyConfirmState();
}

class _MyConfirmState extends State<MyConfirm> {
  // List cart = [];
  String? valueFromFirstPage;
  @override
  void initState() {
    super.initState();

    confirValue(valueFromFirstPage);
  }

  Future<Map<String, dynamic>?> confirValue(String? valueFromFirstPage) async {
    try {
      var respon = await http.get(Uri.parse(
          'https://rmemanagement.online/api/confirm/$valueFromFirstPage'));
      if (respon.statusCode == 200) {
        final dynamic dataRespon = jsonDecode(respon.body);
        return dataRespon;
      } else {
        print('Error: ${respon.statusCode}');
      }
    } catch (e) {
      // print(e);
    }
  }

  Widget build(BuildContext context) {
    final String? valueFromFirstPage =
        ModalRoute.of(context)?.settings.arguments as String?;
    confirValue(valueFromFirstPage);

    final TextStyle textStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
    final lebar = Lebar();
    double width = lebar.widthDevice;
    double height = lebar.heightDevice;
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          width: width / 1,
          // height: double/,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: FutureBuilder<Map<String, dynamic>?>(
              future: confirValue(valueFromFirstPage),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: width / 5,
                    height: height / 5,
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error : ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('Data tidak tersedia'); // Atau widget lainnya
                } else {
                  final cart = snapshot.data?['cart'];
                  final event = snapshot.data?['event'];
                  final user = snapshot.data?['user'];
                  final harga = snapshot.data?['harga'];
                  // print(harga.length);

                  // final userName = userData['user']?['name'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nama', style: textStyle),
                          Text(user['name'], style: textStyle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Invoice', style: textStyle),
                          Text('$valueFromFirstPage', style: textStyle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Konser', style: textStyle),
                          Text(event['event'], style: textStyle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jumlah Ticket', style: textStyle),
                          Text(cart['qty'], style: textStyle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: width,
                              height: height / 10,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: harga.length,
                                  itemBuilder: (context, index) {
                                    final hargas = harga[index];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(hargas['kategori_harga']),
                                            Text(hargas['quantity']),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cart['konfirmasi'] == null
                                ? "Belum Konfirmasi"
                                : "Sudah Konfirmasi",
                            style: textStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: width,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('CONFIRM')),
                      )
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
