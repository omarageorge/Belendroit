import 'package:flutter/material.dart';
import 'package:belendroit/components/screen_title.dart';
import 'package:belendroit/components/offer_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  static String id = 'bookmark_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
      child: Column(
        children: <Widget>[
          const ScreenTitle(
            text: 'Saved',
            icon: Icons.bookmark_added_sharp,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView(
              children: const <OfferCard>[
                OfferCard(),
                OfferCard(),
                OfferCard(),
                OfferCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
