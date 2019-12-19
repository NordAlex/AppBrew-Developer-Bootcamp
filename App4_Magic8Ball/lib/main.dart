import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int prediction = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic 8 ball'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          child: Image.asset('images/ball$prediction.png'),
          onPressed: generateNumber,
        ),
      ),
    );
  }

  void generateNumber() {
    const maxNumber = 5;
    final generator = Random();

    setState(() {
      prediction = generator.nextInt(maxNumber) + 1;
    });
  }
}
