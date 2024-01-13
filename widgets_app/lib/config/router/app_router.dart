import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/animated/animated_screen.dart';
import 'package:widgets_app/presentation/screens/app_tutorial/app_tutorial_screen.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';
import 'package:widgets_app/presentation/screens/infinite_scroll/infinite_scroll_screen.dart';
import 'package:widgets_app/presentation/screens/progress/progress_screen.dart';
import 'package:widgets_app/presentation/screens/snackbar/snackbar_screen.dart';
import 'package:widgets_app/presentation/screens/ui_controls/ui_controls_screen.dart';

class AppRouter {
  static const index = '/';
  static const buttons = '/buttons';
  static const cards = '/cards';
  static const progress = '/progress';
  static const snackbar = '/snackbar';
  static const animatedContainer = '/animatedContainer';
  static const uiControls = '/uiControls';
  static const tutorial = '/tutorial';
  static const infiniteScroll = '/infiniteScroll';

  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: index,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: buttons,
        builder: (context, state) => const ButtonsScreen(),
      ),
      GoRoute(
        path: cards,
        builder: (context, state) => const CardsScreen(),
      ),
      GoRoute(
        path: progress,
        builder: (context, state) => const ProgressScreen(),
      ),
      GoRoute(
        path: snackbar,
        builder: (context, state) => const SnackbarScreen(),
      ),
      GoRoute(
        path: animatedContainer,
        builder: (context, state) => const AnimatedScreen(),
      ),
      GoRoute(
        path: uiControls,
        builder: (context, state) => const UiControlsScreen(),
      ),
      GoRoute(
        path: tutorial,
        builder: (context, state) => const AppTutorialScreen(),
      ),
      GoRoute(
        path: infiniteScroll,
        builder: (context, state) => const InfiniteScrollScreen(),
      ),
    ],
  );
}
