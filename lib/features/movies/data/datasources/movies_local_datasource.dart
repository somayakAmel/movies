import 'package:hive/hive.dart';

import '../../../../constants/hive_box_cons.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';

abstract class MoviesLocalDatasource {
  List<MovieEntity> getMovies(
    String hiveConst,
  );

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
  List<MovieEntity> getMovies(String hiveConst) {
    var box = Hive.box(hiveConst);
    return box.values.toList().cast<MovieEntity>();
  }
}
