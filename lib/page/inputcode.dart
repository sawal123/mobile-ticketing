import 'package:flutter/material.dart';

class InputCode extends StatefulWidget {
  const InputCode({super.key});

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Input Code Untuk Verivikasi Peserta',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  // controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        //
                      },
                      style: ElevatedButton.styleFrom(
                          // minimumSize: Size(, 40),
                          ),
                      child: Text('Sumbit')),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
