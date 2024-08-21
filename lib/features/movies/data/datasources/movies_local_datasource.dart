import 'package:hive/hive.dart';

import '../../../../constants/hive_box_cons.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';

abstract class MoviesLocalDatasource {
  List<MovieEntity> getNowPlaying();
  List<MovieEntity> getUpcomingMovies();
  List<MovieEntity> getPopularMovies();
  MovieDetailsEntity? getMovie(int id);
}

class MoviesLocalDatasourceImpl implements MoviesLocalDatasource {
  @override
  MovieDetailsEntity? getMovie(int id) {
    var box = Hive.box(HiveBoxCons.movieDetailsBox);
    if (!box.containsKey(id)) {
      return null;
    }
    return box.get(id) as MovieDetailsEntity;
  }

  @override
  List<MovieEntity> getNowPlaying() {
    var box = Hive.box(HiveBoxCons.nowPlayingMoviesBox);
    return box.values.toList().cast<MovieEntity>();
  }

  @override
  List<MovieEntity> getPopularMovies() {
    var box = Hive.box(HiveBoxCons.popularMoviesBox);
    return box.values.toList().cast<MovieEntity>();
  }

  @override
  List<MovieEntity> getUpcomingMovies() {
    var box = Hive.box(HiveBoxCons.upcomingMoviesBox);
    return box.values.toList().cast<MovieEntity>();
  }
}
