import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorsList);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkTheme() {
    state = state.copyWith(isDarkTheme: !state.isDarkTheme);
  }

  void changeTheme(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
