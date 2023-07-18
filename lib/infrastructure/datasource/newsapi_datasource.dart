import 'package:app_news/config/constants/environment.dart';
import 'package:app_news/domain/datasource/news_datasource.dart';
import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/infrastructure/mapper/news_mapper.dart';
import 'package:app_news/infrastructure/models/newsapi/newsapi_response.dart';
import 'package:dio/dio.dart';

class NewsapiDatasource extends NewsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      queryParameters: {"apiKey": Environment.theApiNewsKey}));

  List<News> _jsonToNews(Map<String, dynamic> json) {
    final newsApiResponse = NewsApiResponse.fromJson(json);
    final List<News> news = newsApiResponse.articles
        .map((newsApi) => NewsMapper.newsApiToEntity(newsApi))
        .where((newsApi) => newsApi.urlToImage != "no-imagen")
        .toList();
    return news;
  }

  List<News> _jsonToNewsByCategory(Map<String, dynamic> json, String category) {
    final newsApiResponse = NewsApiResponse.fromJson(json);
    final List<News> news = newsApiResponse.articles
        .map((newsApi) => NewsMapper.newsDetailsToEntity(newsApi, category))
        .where((newsApi) => newsApi.urlToImage != "no-imagen")
        .toList();
    return news;
  }

  @override
  Future<List<News>> getNews() async {
    final response =
        await dio.get("/top-headlines", queryParameters: {"country": "us"});
    if (response.statusCode != 200) {
      List<News> news = [];
      return news;
    }
    return _jsonToNews(response.data);
  }

  @override
  Future<List<News>> getNewsByCategory(String category) async {
    final response = await dio.get("/top-headlines",
        queryParameters: {"country": "us", "category": category});
    if (response.statusCode != 200) {
      List<News> news = [];
      return news;
    }
    return _jsonToNewsByCategory(response.data, category);
  }
}
