import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:belendroit/models/offer_model.dart';

class OfferProvider extends ChangeNotifier {
  // Offers
  final List<Offer> _offers = [];

  final List<Offer> _saved = [];

  int get offerCount => _offers.length;

  UnmodifiableListView<Offer> get offers => UnmodifiableListView(_offers);
  UnmodifiableListView<Offer> get saved => UnmodifiableListView(_saved);

  List<Offer> get getSaved =>
      _offers.where((offer) => offer.bookmark == true).toList();

  void addOffer(Offer newOffer) {
    final Offer offer = Offer(
      title: newOffer.title,
      image: newOffer.image,
      hangout: newOffer.hangout,
    );

    _offers.add(offer);
    notifyListeners();
  }

  void save(Offer saved) {
    final Offer offer = Offer(
      title: saved.title,
      image: saved.image,
      hangout: saved.hangout,
    );

    _saved.add(offer);
    notifyListeners();
  }

  void removeOffer(Offer offer) {
    _offers.remove(offer);
    notifyListeners();
  }

  void removeSaved(Offer offer) {
    _saved.remove(offer);
    notifyListeners();
  }
}
