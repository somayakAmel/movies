import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/core/api/api_consumer.dart';
import 'package:movies/features/movies/data/models/movieDetailsModel.dart';
import 'package:movies/features/movies/data/models/movieModel.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';

import '../../../../constants/hive_box_cons.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/functions/save_box.dart';
import '../../domain/entities/movie.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieEntity>> getNowPlaying();
  Future<List<MovieEntity>> getUpcomingMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<MovieDetailsEntity> getMovie(int id);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  final ApiConsumer apiConsumer;
  MoviesRemoteDatasourceImpl(this.apiConsumer);

  @override
  Future<List<MovieEntity>> getNowPlaying() async {
    final response = await apiConsumer.getData(Endpoints.nowPlaying);

    return convertToList(response, HiveBoxCons.nowPlayingMoviesBox);
  }

  @override
  Future<MovieDetailsEntity> getMovie(int id) async {
    final response = await apiConsumer.getData(id.toString());
    MovieDetailsEntity movie = MovieDetailsModel.fromJson(response.data);
    return movie;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final response = await apiConsumer.getData(Endpoints.popularMovies);
    return convertToList(response, HiveBoxCons.popularMoviesBox);
  }

  @override
  Future<List<MovieEntity>> getUpcomingMovies() async {
    final response = await apiConsumer.getData(Endpoints.upcomingMovies);
    return convertToList(response, HiveBoxCons.upcomingMoviesBox);
  }

  List<MovieEntity> convertToList(response, String boxName) {
    List<MovieEntity> movies = [];
    for (var movie in response.data['results']) {
      MovieEntity movieModel = MovieModel.fromJson(movie);
      movies.add(movieModel);
    }

    saveBox(movies, boxName);
    return movies;
  }
}
