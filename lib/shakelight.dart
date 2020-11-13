import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:torch_compat/torch_compat.dart';

class ShakeLight extends StatefulWidget {
  @override
  _ShakeLightState createState() => _ShakeLightState();
}

class _ShakeLightState extends State<ShakeLight> {
  ///On and off State of the torch
  static const List<String> states = [
    'off',
    'onn',
  ];

  String state = states.first;

  ///Shuffle the state on shake detection
  ShakeDetector detector;

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        final newState = (List.of(states)
              ..remove(state)
              ..shuffle())
            .first;

        setState(() {
          this.state = newState;
        });
      },
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    TorchCompat.dispose();
    super.dispose();
  }

  ///Turn on or off light depending on the value of the state
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Image.asset(
        state == 'off'
            ? (() {
                TorchCompat.turnOff();
                return 'images/On.png';
              }())
            : (() {
                TorchCompat.turnOn();
                return 'images/Off.png';
              }()),
      ),
    );
  }
}
