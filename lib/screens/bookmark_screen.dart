import 'package:belendroit/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belendroit/components/offer_card_saved.dart';
import 'package:belendroit/components/screen_title.dart';
import 'package:belendroit/providers/offer_provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  static String id = 'bookmark_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
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
            child: ListView.builder(
                itemCount: Provider.of<OfferProvider>(context).saved.length,
                itemBuilder: (context, index) {
                  return OfferCardSaved(
                    offer: Provider.of<OfferProvider>(context).saved[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
