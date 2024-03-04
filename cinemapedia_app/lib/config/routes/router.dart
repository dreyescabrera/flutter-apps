import 'package:cinemapedia_app/presentation/screens/movies/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
]);
