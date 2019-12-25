import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

const iconSize = 80.0;

class CardIcon extends StatelessWidget {
  const CardIcon({this.text, this.iconData});

  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: iconSize,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
