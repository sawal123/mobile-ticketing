import 'package:flutter/material.dart';

class PasswordToggleInput extends StatefulWidget {
  @override
  _PasswordToggleInputState createState() => _PasswordToggleInputState();
}

class _PasswordToggleInputState extends State<PasswordToggleInput> {
  bool _obscureText = true;
  final passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText:
          _obscureText, // Ini mengatur apakah teks tersembunyi atau tidak
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        labelText: 'Password',
        // Tambahkan atribut lain seperti hintText, border, dsb. sesuai kebutuhan
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
    );
  }
}
