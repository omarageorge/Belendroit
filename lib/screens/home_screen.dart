import 'package:flutter/material.dart';
import 'package:belendroit/components/offer_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {},
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              filled: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black54),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView(
              children: const [
                OfferCard(),
                OfferCard(),
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
