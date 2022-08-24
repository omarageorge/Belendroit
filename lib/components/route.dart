import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  const Link({
    Key? key,
    required this.text,
    required this.action,
    required this.route,
  }) : super(key: key);

  final String text;
  final String action;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, route),
          child: Text(
            action,
            style: const TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
