import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';

part 'movie_list_provider.g.dart';

typedef MovieCallback = Future<List<Movie>> Function({int page});

@riverpod
class MovieList extends _$MovieList {
  int currentPage = 1;

  @override
  Future<List<Movie>> build() async {
    final getMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;

    return getMovies(page: currentPage);
  }

  void loadNextPage() {
    currentPage++;
    ref.invalidateSelf();
  }
}
