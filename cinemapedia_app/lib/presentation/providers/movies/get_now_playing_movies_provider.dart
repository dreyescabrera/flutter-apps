import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_now_playing_movies_provider.g.dart';

@riverpod
Future<List<Movie>> getNowPlayingMovies(GetNowPlayingMoviesRef ref, int page) {
  final getNowPlaying = ref.watch(moviesRepositoryProvider).getNowPlaying;
  return getNowPlaying(page: page);
}
