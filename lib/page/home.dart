import 'package:flutter/material.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:ticketing/api.dart';
import 'package:ticketing/widget/listView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    final widhtDevice = MediaQuery.of(context).size.width;
    final heighDevice = MediaQuery.of(context).size.height;
    print(apiService);
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
                      'https://cdn.idntimes.com/content-images/community/2019/07/pexels-photo-1479139-644db79f0c2c903601dfc29d53a032d1_600x400.jpeg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
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
              // ListApp(),
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
                        'https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2022/08/11203956/GoFood_Tokopedia.jpg'),
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
                        child: const Image(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-photo/illustration-computer-with-purple-background-digital-display-space-ship_579873-1722.jpg?w=740'),
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
                              width: widhtDevice / 5,
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
                              width: widhtDevice / 5,
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
