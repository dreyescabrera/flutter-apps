import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeNotifierProvider).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkTheme();
              },
              icon: Icon(isDarkTheme
                  ? Icons.wb_sunny_outlined
                  : Icons.dark_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final selectedTheme = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            "Este color",
            style: TextStyle(color: color),
          ),
          subtitle: Text("RGB ${color.red}, ${color.green}, ${color.blue}"),
          activeColor: color,
          value: index,
          groupValue: selectedTheme,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeTheme(index);
          },
        );
      },
    );
  }
}
