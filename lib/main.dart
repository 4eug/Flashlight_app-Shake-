import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Flashlight'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: missing_required_param
                FlatButton(
                  onPressed: () {
                    TorchCompat.turnOn();
                  },
                  child: Image.asset('images/On.png'),
                ),
                // ignore: missing_required_param
                FlatButton(
                  onPressed: () {
                    TorchCompat.turnOff();
                  },
                  child: Image.asset('images/Off.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TorchCompat.dispose();
    super.dispose();
  }
}
