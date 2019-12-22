import 'package:flutter/material.dart';

const labelTextStyle = 
                TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

class CardIcon extends StatelessWidget {
  const CardIcon({this.text, this.iconData});

  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 80,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: labelTextStyle,
          )
        ],
     
    );
  }
}