import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
// import 'package:flashlight_app/shakelight.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Poppins',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 100),
              SlimyCard(
                topCardWidget:
                    topCardWidget((snapshot.data) ? lighton() : lightoff()),
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// This widget will be passed as Top Card's Widget.
Widget topCardWidget(String imagePath) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      //ShakeLight(),
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(imagePath)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
      Text(
        'ShakyTorch',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      SizedBox(height: 15),
      Text(
        'Shake Your Phone',
        style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
    ],
  );
}

String lighton() {
  TorchCompat.turnOn();
  return 'images/On.png';
}

String lightoff() {
  TorchCompat.turnOff();
  return 'images/Off.png';
}

// This widget will be passed as Bottom Card's Widget.
Widget bottomCardWidget() {
  return Text(
    'The Torch is On \nShake Phone Twice to Turn Off.',
    style: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}
