import 'dart:async';

import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:flashlight_app/shakelight.dart';
import 'package:background_mode/background_mode.dart';

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
          title: Text('ShakyTorch'),
        ),
        body: Container(
          child: Stack(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShakeLight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
