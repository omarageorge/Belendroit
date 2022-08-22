import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({Key? key, required this.text, required this.icon})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35.0,
          color: Colors.lightBlue,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.lightBlue,
            fontWeight: FontWeight.w500,
            fontSize: 25.0,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}
