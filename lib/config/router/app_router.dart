import 'package:app_news/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: "category/:categoryId",
          name: CategoryNews.name,
          builder: (context, state) {
            final categoryId = state.pathParameters["categoryId"] ?? "no-id";
            return CategoryNews(category: categoryId);
          },
        ),
        GoRoute(
          path: "article/:urlId",
          name: ArticleView.name,
          builder: (context, state) {
            final urlId = state.pathParameters["urlId"] ?? "no-url";
            return ArticleView(blogUrl: urlId);
          },
        )
      ])
]);
