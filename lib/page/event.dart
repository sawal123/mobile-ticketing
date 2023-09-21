import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticketing/particle/baseUrl.dart';
import 'package:ticketing/particle/widhtAndHeight.dart';
import 'package:http/http.dart' as http;

class MyEvent extends StatefulWidget {
  const MyEvent({super.key});

  @override
  State<MyEvent> createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> {
  TextEditingController _searchController = TextEditingController();
  //  bool _isSearching = false;
  List events = [];
  List<dynamic> searchResults = [];
  void initState() {
    super.initState();
    getEvent();
  }

  void searchEvent(String query) {
    setState(() {
      searchResults = events.where((event) {
        return event['event'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> getEvent() async {
    final urlBase = BaseUrl().baseUrl;
    var responApi = await http.get(Uri.parse("$urlBase/listEvent"));
    // print(responApi.body);
    if (responApi.statusCode == 200) {
      final dynamic event = jsonDecode(responApi.body);
      print(event);
      if (event is Map<dynamic, dynamic>) {
        final dataEvent = event['event'];
        setState(() {
          events = dataEvent;
          // myname = name!;
          // print(data);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final urlStorage = BaseUrl().sUrl;
    var lebar = Lebar();
    final width = lebar.widthDevice;
    final heigth = lebar.heightDevice;
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)),
                // padding: EdgeInsets.all(30),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    searchEvent(value);
                  },
                  onSubmitted: (value) {
                    searchResults;
                  },
                  decoration: InputDecoration(
                      labelText: "Search..",
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              width: width,
              height: heigth / 1.4,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: searchResults.length > 0
                    ? searchResults.length
                    : events.length,
                itemBuilder: (context, index) {
                  final eventss = searchResults.length > 0
                      ? searchResults[index]
                      : events[index];
                  print(eventss['event']);
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: width / 2.5,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235),
                          border: Border.all(
                              color: Color.fromARGB(255, 109, 109, 109)),
                          borderRadius: BorderRadius.circular(6)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/list',
                              arguments: eventss['uid']);
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                urlStorage + "/cover/" + eventss['cover'],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                eventss['event'].toString(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(eventss['alamat']),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  );

                  // ======================
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
