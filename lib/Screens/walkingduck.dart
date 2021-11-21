import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class WalkingDuck extends StatefulWidget {
  const WalkingDuck({Key? key}) : super(key: key);

  @override
  _WalkingDuckState createState() => _WalkingDuckState();
}

class _WalkingDuckState extends State<WalkingDuck> {
  bool _isWalking = false;
  Timer? _clockTimer;
  Color? newColor = Colors.blueAccent;
  final _random = Random();

  _randomColorFun() {
    _clockTimer = Timer.periodic(const Duration(milliseconds: 350), (timer) {
      setState(() {
        newColor = Colors.primaries[_random.nextInt(Colors.primaries.length)]
            [_random.nextInt(9) * 100];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_isWalking == true) {
            _clockTimer!.cancel();
          } else {
            _randomColorFun();
          }
          setState(() {
            _isWalking = !_isWalking;
          });
        },
        child: Container(
            decoration: BoxDecoration(
              color: newColor,
            ),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isWalking
                    ? Image.asset(
                        'assets/duck.gif',
                        height: height * 0.9,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/duck.png',
                        height: height * 0.9,
                        fit: BoxFit.contain,
                      ),
              ],
            )),
      ),
    );
  }
}
