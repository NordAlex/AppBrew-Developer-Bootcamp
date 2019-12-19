import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _leftNumber = 1;
  int _rightNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton(
            child: Image.asset('images/dice$_rightNumber.png'),
            onPressed: roleDice,
          )),
          Expanded(
              child: FlatButton(
            child: Image.asset('images/dice$_leftNumber.png'),
            onPressed: roleDice,
          ))
        ],
      ),
    );
  }

  void roleDice() {
    const maxNumber = 6;
    final randomGenerator = Random();

    setState(() {
      
    _leftNumber = randomGenerator.nextInt(maxNumber) + 1;
    _rightNumber = randomGenerator.nextInt(maxNumber) + 1;
    });
  }
}
