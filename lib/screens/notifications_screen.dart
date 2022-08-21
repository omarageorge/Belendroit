import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static String pageId = 'notifications_screen';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications'),
    );
  }
}
