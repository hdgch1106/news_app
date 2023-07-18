import 'package:app_news/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlogTile extends StatelessWidget {
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url});

  final String imageUrl, title, desc, url;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.24,
            width: size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl,
                    fit: BoxFit.cover, height: size.height * 0.24,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return SizedBox(
                      height: size.height * 0.24,
                      width: size.width,
                      child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return GestureDetector(
                    onTap: () =>
                        context.push("/article/${Uri.encodeComponent(url)}"),
                    child: child,
                  );
                })),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: colors.primary,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: colors.primary),
          )
        ],
      ),
    );
  }
}
