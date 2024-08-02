import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static load() async {
    await dotenv.load();
  }

  static final String theMovieDb = dotenv.get('THE_MOVIE_DB_KEY');
}
