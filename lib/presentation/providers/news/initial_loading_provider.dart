import 'package:app_news/presentation/providers/news/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvier = Provider((ref) {
  final step1 = ref.watch(newsProviders).isEmpty;
  if (step1) return true;
  return false;
});
