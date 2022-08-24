class Offer {
  final String title;
  final String provider;
  late bool bookmark;

  Offer({required this.title, required this.provider, this.bookmark = false});

  void toggleBookmark() {
    bookmark = !bookmark;
  }
}
