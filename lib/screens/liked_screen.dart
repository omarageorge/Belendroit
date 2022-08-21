import 'package:flutter/material.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({Key? key}) : super(key: key);

  static String pageId = 'liked_screen';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Liked'),
    );
  }
}
