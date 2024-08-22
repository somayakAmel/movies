import 'package:movies/core/api/api_consumer.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import '../../domain/entities/movie.dart';
import '../models/movieDetailsModel.dart';
import '../models/movieModel.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieEntity>> getMovies(String endpoint);

  Future<MovieDetailsEntity> getMovie(int id);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  final ApiConsumer apiConsumer;
  MoviesRemoteDatasourceImpl(this.apiConsumer);

  @override
  Future<MovieDetailsEntity> getMovie(int id) async {
    final response = await apiConsumer.getData(id.toString());
    MovieDetailsEntity movie = MovieDetailsModel.fromJson(response.data);
    return movie;
  }

  @override
  Future<List<MovieEntity>> getMovies(String endpoint) async {
    final response = await apiConsumer.getData(endpoint);
    return convertToList(response);
  }

  List<MovieEntity> convertToList(response) {
    List<MovieEntity> movies = [];
    for (var movie in response.data['results']) {
      MovieEntity movieModel = MovieModel.fromJson(movie);
      movies.add(movieModel);
    }

    return movies;
  }
}
