import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({this.onTap, this.text});

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomMenuHeight,
        color: kBottomMenuColor,
        child: Center(
            child: Text(
          text,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
