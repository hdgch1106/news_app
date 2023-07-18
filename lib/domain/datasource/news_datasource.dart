import 'package:app_news/domain/entities/news.dart';

abstract class NewsDatasource {
  Future<List<News>> getNews();
  Future<List<News>> getNewsByCategory(String category);
}
