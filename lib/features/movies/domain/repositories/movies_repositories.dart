import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie_details.dart';

abstract class MoviesRepository {
  Future<Either<List<MovieEntity>, Failure>> getNowPlaying();
  Future<Either<List<MovieEntity>, Failure>> getUpcomingMovies();
  Future<Either<List<MovieEntity>, Failure>> getPopularMovies();
  Future<Either<MovieDetailsEntity?, Failure>> getMovie(int id);
}
