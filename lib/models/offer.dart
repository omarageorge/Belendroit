class Offer {
  final String title;
  final String provider;
  late bool bookmarked;

  Offer({required this.title, required this.provider, this.bookmarked = false});
}
