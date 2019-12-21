import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                XylophoneKey(
                  onPress: () => playSound(1),
                  backgroundColor: Colors.red,
                ),
                XylophoneKey(
                  onPress: () => playSound(2),
                  backgroundColor: Colors.orange,
                ),
                XylophoneKey(
                  onPress: () => playSound(3),
                  backgroundColor: Colors.yellow,
                ),
                XylophoneKey(
                  onPress: () => playSound(4),
                  backgroundColor: Colors.green,
                ),
                XylophoneKey(
                  onPress: () => playSound(5),
                  backgroundColor: Colors.teal,
                ),
                XylophoneKey(
                  onPress: () => playSound(6),
                  backgroundColor: Colors.blue,
                ),
                XylophoneKey(
                  onPress: () => playSound(7),
                  backgroundColor: Colors.purple,
                ),
              ]),
        ),
      ),
    );
  }

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }
}

class XylophoneKey extends StatelessWidget {
  const XylophoneKey({Key key, this.onPress, this.backgroundColor})
      : super(key: key);

  final Function onPress;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FlatButton(
      onPressed: onPress,
      child: null,
      color: backgroundColor,
    ));
  }
}
