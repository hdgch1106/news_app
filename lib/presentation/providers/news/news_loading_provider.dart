import 'package:app_news/presentation/providers/news/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsLoadingProvider =
    Provider<void>((ref) => ref.read(newsProviders.notifier).loadNews());
