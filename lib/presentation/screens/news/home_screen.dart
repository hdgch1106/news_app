import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_news/presentation/providers/providers.dart';
import 'package:app_news/presentation/widgets/widgets.dart';
import 'package:app_news/infrastructure/models/newsapi/helper/categories_data.dart';
import 'package:app_news/infrastructure/models/newsapi/newsapi_categories.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  List<NewsapiCategories> categories = <NewsapiCategories>[];
  @override
  void initState() {
    super.initState();
    ref.read(newsLoadingProvider);
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvier);
    if (initialLoading) return const FullScreenLoader();

    final news = ref.watch(newsProviders);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          //Categories
          SizedBox(
            height: 70,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                }),
          ),

          // Blogs
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
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key, required this.imageUrl, required this.categoryName});

  final String imageUrl, categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/category/${categoryName.toLowerCase()}")
      /*  Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(category: categoryName.toLowerCase()))); */
      ,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
