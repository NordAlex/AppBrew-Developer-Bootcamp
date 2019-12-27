import 'package:flutter/material.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({@required this.backgroundColor, this.child, this.onTap});
  final Widget child;
  final Color backgroundColor;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: const  EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backgroundColor),
      ),
    );
  }
}
