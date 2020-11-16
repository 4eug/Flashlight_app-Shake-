import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:shake/shake.dart';

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
  int counter = 1;
  ShakeDetector detector;
  String onImage = "images/Off.png";
  String offImage = "images/Off.png";

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        counter++;
        print(counter);
        if (counter == 2) {
          //TorchCompat.turnOn();
          //_isOn = true;
          TorchCompat.turnOn();

          onImage = "images/On.png";
          offImage = "images/On.png";
        }

        if (counter == 4) {
          //TorchCompat.turnOff();
          // _isOn = false;
          //lightoff();
          TorchCompat.turnOff();
          offImage = "images/Off.png";
          onImage = "images/Off.png";

          counter = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    TorchCompat.dispose();
    super.dispose();
  }

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
                topCardWidget: topCardWidget(
                    (snapshot.data) ? this.onImage : this.offImage),
                bottomCardWidget: bottomCardWidget(),
                slimeEnabled: true,
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

String lighton(String string, int counter) {
  TorchCompat.turnOn();
  return string;
}

String lightoff(String string, int counter) {
  TorchCompat.turnOff();
  return string;
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
