class News {
  String title;
  String description;
  String category;
  String url;
  String urlToImage;
  DateTime publishedAt;

  News(
      {required this.title,
      required this.description,
      required this.category,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});
}
