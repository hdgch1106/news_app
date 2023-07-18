import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/infrastructure/models/newsapi/newsapi_articles.dart';

class NewsMapper {
  static News newsApiToEntity(NewsApiArticles articles) => News(
      title: articles.title,
      description: articles.description,
      url: articles.url,
      category: "",
      urlToImage: articles.urlToImage != "" ? articles.urlToImage : "no-imagen",
      publishedAt: articles.publishedAt);
  static News newsDetailsToEntity(NewsApiArticles articles, String category) =>
      News(
          title: articles.title,
          description: articles.description,
          url: articles.url,
          category: category,
          urlToImage:
              articles.urlToImage != "" ? articles.urlToImage : "no-imagen",
          publishedAt: articles.publishedAt);
}
