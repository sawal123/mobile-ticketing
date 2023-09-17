import 'package:flutter/material.dart';
import 'dart:ui';
// import 'package:ticketing/molucel/inputPassword.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing/page/home.dart';
import 'package:ticketing/particle/baseUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  bool _obscureText = true;
  bool _cekLogin = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var urlBase = BaseUrl().baseUrl;

  Future<void> _login() async {
    final responLogin = await http.post(Uri.parse('$urlBase/login'), body: {
      'email': emailController.text,
      'password': passwordController.text,
    });
    // print(responLogin.statusCode);
    if (responLogin.statusCode == 200) {
      final data = json.decode(responLogin.body);
      final token = data['data']['token'];
      final name = data['data']['name'];
      // print(name);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      final storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      await storage.write(key: 'name', value: name);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _cekLogin = true;
      });
      print('Gagal');
    }
  }

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
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
              SizedBox(
                height: 30,
              ),
              if (_cekLogin == true) Text('Email atau Password Salah!'),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //
              // PasswordToggleInput(),
              TextField(
                controller: passwordController,
                obscureText:
                    _obscureText, // Ini mengatur apakah teks tersembunyi atau tidak
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle visibilitas teks
                      });
                    },
                  ),
                ),
                // Lainnya: controller, validator, onChanged, dsb.
              ),
              SizedBox(
                height: 10,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed: _login,
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
