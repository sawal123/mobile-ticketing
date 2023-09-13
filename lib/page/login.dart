import 'package:flutter/material.dart';
import 'package:ticketing/molucel/inputPassword.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Image(
                image: NetworkImage(
                    'https://rmemanagement.online/storage/logo/logo.png'),
                width: 150,
              ),
              SizedBox(
                height: 50,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // const TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: 'Password...',
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.lock),
              //   ),
              // ),
              PasswordToggleInput(),
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
      ),
    ));
  }
}
