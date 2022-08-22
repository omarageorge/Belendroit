import 'package:flutter/material.dart';
import 'package:belendroit/components/notification_card.dart';
import 'package:belendroit/components/screen_title.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static String id = 'notifications_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
      child: Column(
        children: [
          const ScreenTitle(
              text: 'Notifications', icon: Icons.notifications_active),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView(
              children: const [
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
