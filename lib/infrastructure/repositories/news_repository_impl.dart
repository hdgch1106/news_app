import 'package:app_news/domain/datasource/news_datasource.dart';
import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDatasource datasource;
  NewsRepositoryImpl(this.datasource);

  @override
  Future<List<News>> getNews() {
    return datasource.getNews();
  }

  @override
  Future<List<News>> getNewsByCategory(String category) {
    return datasource.getNewsByCategory(category);
  }
}
