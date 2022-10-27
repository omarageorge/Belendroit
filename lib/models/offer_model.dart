import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String? image;
  final String? title;
  final String? description;
  final String? city;
  final String? hangout;
  late bool bookmark;

  Offer({
    this.image,
    this.title,
    this.description,
    this.city,
    this.hangout,
    this.bookmark = false,
  });

  get url => null;

  void toggleBookmark() {
    bookmark = !bookmark;
  }

/* Retrieve data from firestore */
  factory Offer.fromFireStore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    return Offer(
      image: data?['image'],
      title: data?['title'],
      description: data?['description'],
      city: data?['city'],
      hangout: data?['hangout'],
    );
  }
}
