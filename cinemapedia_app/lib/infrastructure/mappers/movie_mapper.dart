import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/movie_themoviedb.dart';

class MovieMapper {
  static Movie theMovieDbToDomain(MovieFromMovieDb theMovieDb) {
    const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

    const String notFoundUrl =
        'https://imgs.search.brave.com/K7TdjciLTAmvqtg6-fqKm20muPAAzRMj1OonJ6HIhME/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAwLzg5LzU1LzE1/LzM2MF9GXzg5NTUx/NTk2X0xkSEFaUnd6/M2k0RU00SjBOSE5I/eTJoRVVZRGZYYzBq/LmpwZw';

    return Movie(
        adult: theMovieDb.adult,
        backdropPath: theMovieDb.backdropPath != ''
            ? baseImageUrl + theMovieDb.backdropPath
            : notFoundUrl,
        genreIds: theMovieDb.genreIds.map((e) => e.toString()).toList(),
        id: theMovieDb.id,
        originalLanguage: theMovieDb.originalLanguage,
        originalTitle: theMovieDb.originalTitle,
        overview: theMovieDb.overview,
        popularity: theMovieDb.popularity,
        posterPath: theMovieDb.posterPath != ''
            ? baseImageUrl + theMovieDb.posterPath
            : notFoundUrl,
        releaseDate: theMovieDb.releaseDate,
        title: theMovieDb.title,
        video: theMovieDb.video,
        voteAverage: theMovieDb.voteAverage,
        voteCount: theMovieDb.voteCount);
  }
}
