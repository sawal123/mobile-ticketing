import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
// import 'package:ticketing/molucel/inputPassword.dart';
import 'package:http/http.dart' as http;
import 'package:Gotik/page/home.dart';
import 'package:Gotik/particle/baseUrl.dart';
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
      "email": emailController.text,
      "password": passwordController.text,
    });
    // print(responLogin.statusCode);
    if (responLogin.statusCode == 200) {
      final data = json.decode(responLogin.body);
      final token = data['data']['token'];
      final name = data['data']['name'];
      final prefs = await SharedPreferences.getInstance();
      print(name);
      prefs.setString('token', token);
      prefs.setString('name', name);

      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      await storage.write(key: 'name', value: name);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
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
    return WillPopScope(
      onWillPop: () async {
        // Jika tombol kembali ditekan di halaman login, keluar dari aplikasi
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Keluar Aplikasi'),
            content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop( SystemNavigator.pop()),
                child: const Text('Ya'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 30,
                ),
                if (_cekLogin == true) const Text('Email atau Password Salah!'),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //
                // PasswordToggleInput(),
                TextField(
                  controller: passwordController,
                  obscureText:
                      _obscureText, // Ini mengatur apakah teks tersembunyi atau tidak
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Toggle visibilitas teks
                        });
                      },
                    ),
                  ),
                  // Lainnya: controller, validator, onChanged, dsb.
                ),
                const SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 45)),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
