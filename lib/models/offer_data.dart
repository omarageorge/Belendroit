import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:belendroit/models/offer_model.dart';

class OfferData extends ChangeNotifier {
  final List<Offer> _offers = [
    Offer(
      title: '10% Discounts on all Whiskeys',
      image: 'whiskey.jpg',
      hangout: 'Thrones Lounge Bar & Restaurant',
    ),
    Offer(
      title: 'Black panther 2 tickets at 10k',
      image: 'black panther.jpg',
      hangout: 'Century cinemax',
    ),
    Offer(
      title: 'Get 3 glasses of beer at 12k',
      image: 'beer.jpg',
      hangout: 'Ashiana Restaurant',
    ),
    Offer(
      title: '15% off original price for silent disco',
      image: 'silent disco.jpg',
      hangout: 'Banana Bar',
    ),
    Offer(
      title: 'Buy 2 plates, get one more free',
      image: 'pork.jpg',
      hangout: 'Ariky fresh pork joint',
    ),
    Offer(
      title: 'Save 5k on original price',
      image: 'burger.jpg',
      hangout: 'KFC | Bugolobi',
    ),
  ];

  final List<Offer> _savedOffers = [];

  int get offerCount => _offers.length;

  int get savedOfferCount => _savedOffers.length;

  UnmodifiableListView<Offer> get offers => UnmodifiableListView(_offers);

  UnmodifiableListView<Offer> get savedOffers =>
      UnmodifiableListView(_savedOffers);

  void addOffer(Offer newOffer) {
    final Offer offer = Offer(
      title: newOffer.title,
      image: newOffer.image,
      hangout: newOffer.hangout,
    );

    _offers.add(offer);
    notifyListeners();
  }

  void addSaveOffer(Offer newSavedOffer) {
    final Offer savedOffer = Offer(
      title: newSavedOffer.title,
      image: newSavedOffer.image,
      hangout: newSavedOffer.hangout,
    );

    _savedOffers.add(savedOffer);
    notifyListeners();
  }
}
