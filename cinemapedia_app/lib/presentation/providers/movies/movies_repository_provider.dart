import 'package:cinemapedia_app/domain/repositories/movies_repository.dart';
import 'package:cinemapedia_app/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movies_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository_provider.g.dart';

@riverpod
MoviesRepository moviesRepository(MoviesRepositoryRef ref) {
  return MoviesRepositoryImpl(moviesDataSource: TheMovieDbDataSource());
}
