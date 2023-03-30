import 'dart:math';
import 'package:flutter/material.dart';

import '../scale_button.dart';

class FloatingDoneButton extends StatelessWidget {
  final String label;
  final AssetImage icon;
  final GestureTapCallback onPressed;
  final double angle;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;
  final TextStyle textstyle;

  const FloatingDoneButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.angle = -5,
    this.bgColor = Colors.black,
    this.textstyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    this.iconColor = Colors.white,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ScaleButton(
        onPressed: onPressed,
        label: 'Done',
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: bgColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Color(0x1a252526),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(26),
          ),
          child: Row(
            children: <Widget>[
              Image(
                image: icon,
                height: 22,
                width: 22,
                color: iconColor,
              ),
              const SizedBox(width: 8),
              Text(label, style: textstyle),
            ],
          ),
        ),
      ),
    );
  }
}
