import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/features/movies/data/datasources/movies_local_datasource.dart';
import 'package:movies/features/movies/data/datasources/movies_remote_datasource.dart';
import '../../../../core/errors/dio_failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repositories/movies_repositories.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDatasource remoteDatasource;
  final MoviesLocalDatasource localDatasource;
  MoviesRepositoryImpl(this.remoteDatasource, this.localDatasource);
  @override
  Future<Either<MovieDetailsEntity?, Failure>> getMovie(int id) async {
    try {
      bool isConnected = await InternetConnectionChecker().hasConnection;

      if (isConnected) {
        final response = await remoteDatasource.getMovie(id);
        return Left(response);
      } else {
        // MovieDetailsEntity? movie = localDatasource.getMovie(id);
        // return Left(movie);
        return Left(null);
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Right(DioFailure.fromDioError(e));
      }
      return Right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<List<MovieEntity>, Failure>> getNowPlaying() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    List<MovieEntity>? nowPlayingMovies = localDatasource.getNowPlaying();
    if (isConnected) {
      if (nowPlayingMovies.isNotEmpty) {
        return Left(nowPlayingMovies);
      }
      final response = await remoteDatasource.getNowPlaying();
      return Left(response);
    } else {
      return Left(nowPlayingMovies);
    }
  }

  @override
  Future<Either<List<MovieEntity>, Failure>> getPopularMovies() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    List<MovieEntity>? popularMovies = localDatasource.getPopularMovies();
    if (isConnected) {
      if (popularMovies.isNotEmpty) {
        return Left(popularMovies);
      }
      final response = await remoteDatasource.getNowPlaying();
      return Left(response);
    } else {
      return Left(popularMovies);
    }
  }

  @override
  Future<Either<List<MovieEntity>, Failure>> getUpcomingMovies() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    List<MovieEntity>? upcomingMovies = localDatasource.getUpcomingMovies();
    if (isConnected) {
      if (upcomingMovies.isNotEmpty) {
        return Left(upcomingMovies);
      }
      final response = await remoteDatasource.getNowPlaying();
      return Left(response);
    } else {
      return Left(upcomingMovies);
    }
  }
}
