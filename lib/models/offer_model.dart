class Offer {
  final String title;
  final String image;
  final String hangout;
  late bool bookmark;

  Offer({
    required this.title,
    required this.image,
    required this.hangout,
    this.bookmark = false,
  });

  void toggleBookmark() {
    bookmark = !bookmark;
  }
}
