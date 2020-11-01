//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:flashlight_app/shake.dart';
//import 'package:background_mode/background_mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //FlashLight light = new FlashLight();

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // void initPlatformState() async {
  //   BackgroundMode.start();

  //   Timer.periodic(Duration(seconds: 120), (timer) {
  //     BackgroundMode.disable();
  //     BackgroundMode.bringToForeground();
  //   });
  // }

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
                FlashLight(),
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
