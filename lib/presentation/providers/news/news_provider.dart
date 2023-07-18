import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/presentation/providers/news/news_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProviders = StateNotifierProvider<NewsNotifier, List<News>>((ref) {
  final fetchNews = ref.watch(newsRepositoryProvider).getNews;
  return NewsNotifier(fetchNews: fetchNews);
});

typedef NewsCallback = Future<List<News>> Function();

class NewsNotifier extends StateNotifier<List<News>> {
  bool isLoading = false;
  NewsCallback fetchNews;
  NewsNotifier({required this.fetchNews}) : super([]);
  Future<void> loadNews() async {
    if (isLoading) return;
    isLoading = true;
    final List<News> news = await fetchNews();
    state = [...state, ...news];
    isLoading = false;
  }
}
