import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.padding,
      required this.color,
      required this.radius,
      required this.backgroundColor,
      required this.iconSize})
      : super(key: key);

  final void Function() onTap;
  final IconData icon;

  final double padding;
  final Color backgroundColor;
  final Color color;
  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Icon(
            icon,
            color: color,
            size: iconSize,
          )),
    );
  }
}
