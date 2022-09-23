import 'package:belendroit/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belendroit/components/notification_card.dart';
import 'package:belendroit/components/screen_title.dart';
import 'package:belendroit/providers/location_provider.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static String id = 'notifications_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        children: [
          const ScreenTitle(
              text: 'Notifications', icon: Icons.notifications_active),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('notifications')
                  .where(
                    'city',
                    isEqualTo: Provider.of<LocationProvider>(context).city,
                  )
                  .snapshots(),
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }

                return ListView(
                  children: snapshot.data!.docs.map((data) {
                    return NotificationCard(
                        title: data['title'],
                        hangout: data['hangout'],
                        date: data['date']);
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
