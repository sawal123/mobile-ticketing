import 'package:flutter/material.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
// import 'package:ticketing/api.dart';
import 'package:ticketing/widget/listView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    final widhtDevice = MediaQuery.of(context).size.width;
    final heighDevice = MediaQuery.of(context).size.height;
    // print(apiService);
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Image.network(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text('Hi, Selamat Datang'),
                      // Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(
                        'Sawalinto',
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
              ListApp(),
              // =========================================
              const SizedBox(
                height: 10,
              ),
              Container(
                width: widhtDevice,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 5, 55),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: const NetworkImage(
                        'https://images.unsplash.com/photo-1682687982029-edb9aecf5f89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80'),
                    width: widhtDevice,
                    height: heighDevice,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Image.network('/assets/slide1.jpg'),

              const SizedBox(
                height: 20,
              ),
              const Text(
                'Menu Ticketing',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image: NetworkImage(
                              'https://robohash.org/hicveldicta.png'),
                        ),
                      ), // Ikon di sebelah kiri teks
                      title: const Text('Transaksi'),
                      subtitle: const Text('Lihat Data Tervervikasi'),
                      trailing: const Icon(
                          Icons.arrow_forward), // Ikon di sebelah kanan teks
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/scan');
                      },
                      child: Container(
                        width: widhtDevice / 2.5,
                        height: heighDevice / 5,
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
                              image: const NetworkImage(
                                  'https://img.icons8.com/?size=512&id=RmfeOvor7w73&format=png'),
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
                        width: widhtDevice / 2.5,
                        height: heighDevice / 5,
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
                              image: const NetworkImage(
                                  'https://img.icons8.com/?size=512&id=80046&format=png'),
                              width: widhtDevice / 7,
                            ),
                            const Text(
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
    );
  }
}
