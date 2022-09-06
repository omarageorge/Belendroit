import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/models/offer_model.dart';
import 'package:belendroit/components/offer_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belendroit/providers/location_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {},
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration().copyWith(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.black54),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('offers')
                  .where('city',
                      isEqualTo: Provider.of<LocationProvider>(context).city)
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
