import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsCategoryProviders =
    StateNotifierProvider<NewsCategoryNotifier, List<News>>((ref) {
  final fetchNewsCategory = ref.watch(newsRepositoryProvider).getNewsByCategory;
  return NewsCategoryNotifier(fetchNewsCategory: fetchNewsCategory);
});

typedef NewsCategoryCallback = Future<List<News>> Function(String category);

class NewsCategoryNotifier extends StateNotifier<List<News>> {
  NewsCategoryCallback fetchNewsCategory;
  NewsCategoryNotifier({required this.fetchNewsCategory}) : super([]);
  Future<void> loadNewsCategory(String category) async {
    if (state.any((element) => element.category == category)) return;
    final List<News> newsCategory = await fetchNewsCategory(category);
    state = [...state, ...newsCategory];
  }
}
