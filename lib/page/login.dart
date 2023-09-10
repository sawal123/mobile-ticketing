import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://rmemanagement.online/storage/logo/logo.png'),
            // Image(
            //   image: NetworkImage(
            //       'https://rmemanagement.online/storage/logo/logo.png'),
            //   width: 150,
            // ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  //
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(minimumSize: Size(0, 45)),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
