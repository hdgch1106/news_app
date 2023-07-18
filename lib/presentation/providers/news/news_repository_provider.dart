import 'package:app_news/infrastructure/datasource/newsapi_datasource.dart';
import 'package:app_news/infrastructure/repositories/news_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsRepositoryProvider = Provider((ref) {
  return NewsRepositoryImpl(NewsapiDatasource());
});
