import 'package:app_news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
  Future<List<News>> getNewsByCategory(String category);
}
