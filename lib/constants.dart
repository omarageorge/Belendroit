import 'package:flutter/material.dart';

ButtonStyle kTextButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 20.0),
  backgroundColor: Colors.black,
  primary: Colors.white,
  textStyle: const TextStyle(
    fontSize: 16.0,
  ),
);

SizedBox kSpaceY = const SizedBox(
  height: 30.0,
);

EdgeInsetsGeometry kScreenPadding = const EdgeInsets.only(
  top: 40.0,
  left: 20.0,
  right: 20.0,
);
