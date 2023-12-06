import 'package:flutter/material.dart';
import 'package:Gotik/particle/baseUrl.dart';

class InputCode extends StatefulWidget {
  const InputCode({super.key});

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  String url = '';
  String _value = '';
  final urlApi = BaseUrl().baseUrl;
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
                  height: 30,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                    // print(_value);
                  },
                  // controller: _textController,t
                  decoration: InputDecoration(
                    labelText: 'Masukan Code',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    // heightFactor: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/confirm',
                              arguments: _value);
                
                          setState(() {
                            url = '$urlApi/confirm/$_value';
                          });
                          print(url);
                        },
                        style: ElevatedButton.styleFrom(
                            // minimumSize: Size(, 40),
                            ),
                        child: Text('Check Code')),
                  ),
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
