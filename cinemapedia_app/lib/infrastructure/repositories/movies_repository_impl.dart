import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl({required this.moviesDataSource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return await moviesDataSource.getNowPlaying(page: page);
  }
}
