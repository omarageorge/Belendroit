import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/models/offer_model.dart';
import 'package:belendroit/components/offer_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belendroit/providers/location_provider.dart';
import 'package:belendroit/components/screen_title.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String id = 'home_screen';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        children: [
          const ScreenTitle(text: 'Available offers', icon: Icons.home),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('offers')
                  .where(
                    'city',
                    isEqualTo: Provider.of<LocationProvider>(context).city,
                  )
                  // .orderBy('created', descending: false)
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
                    return OfferCard(
                        offer: Offer(
                      image: data['image'],
                      title: data['title'],
                      description: data['description'],
                      city: data['city'],
                      hangout: data['hangout'],
                    ));
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
