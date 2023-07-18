import 'package:app_news/domain/entities/news.dart';
import 'package:app_news/presentation/providers/news/news_category_provider.dart';
import 'package:app_news/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNews extends StatelessWidget {
  static const String name = "category-news";
  final String category;

  const CategoryNews({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: _CategoryView(category: category),
    );
  }
}

class _CategoryView extends ConsumerStatefulWidget {
  final String category;
  const _CategoryView({required this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<_CategoryView> {
  @override
  void initState() {
    super.initState();
    ref.read(newsCategoryProviders.notifier).loadNewsCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final newsCategory = ref.watch(newsCategoryProviders);
    final List<News> news = newsCategory
        .where((element) => element.category == widget.category)
        .toList();
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount: news.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                        imageUrl: news[index].urlToImage,
                        title: news[index].title,
                        desc: news[index].description,
                        url: news[index].url);
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
