import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({@required this.backgroundColor, this.child});
  final Widget child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: backgroundColor),
    );
  }
}