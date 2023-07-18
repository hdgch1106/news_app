import 'package:app_news/infrastructure/models/newsapi/newsapi_articles.dart';

class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<NewsApiArticles> articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsApiResponse copyWith({
    String? status,
    int? totalResults,
    List<NewsApiArticles>? articles,
  }) =>
      NewsApiResponse(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) =>
      NewsApiResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsApiArticles>.from(
            json["articles"].map((x) => NewsApiArticles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
