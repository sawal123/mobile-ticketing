import 'package:flutter/material.dart';
import 'package:ticketing/particle/widhtAndHeight.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                Container(
                  width: width,
                  height: heigth / 1.4,
                  // padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black)),
                        child: ListTile(
                          // contentPadding: EdgeInsets.all(10),
                          tileColor: Color.fromARGB(255, 235, 235, 235),
                          leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: 2.0)),
                            child: ClipOval(
                                child: Image.asset('assets/images/avatar.png')),
                          ),
                          title: Text('Sawal'),
                          subtitle: Text('Sudah Tervikasi'),
                          trailing: Icon(Icons.check_circle_outline_sharp),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
