import 'package:app_news/presentation/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    final textColor = isDarkmode ? Colors.white : Colors.black;
    final text2Color = isDarkmode
        ? const Color.fromARGB(255, 123, 196, 255)
        : const Color(0xFF2196F3);
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Flutter",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "Noticias",
            style: TextStyle(color: text2Color, fontWeight: FontWeight.bold),
          )
        ],
      ),
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            ref.read(themeNotifierProvider.notifier).toggleDarkmode();
          },
          icon: !isDarkmode
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
