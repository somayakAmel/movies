import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/constants/hive_box_cons.dart';
import 'package:movies/core/api/endpoints.dart';
import 'package:movies/core/errors/failure.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/features/movies/data/datasources/movies_local_datasource.dart';
import 'package:movies/features/movies/data/datasources/movies_remote_datasource.dart';
import '../../../../core/errors/dio_failure.dart';
import '../../../../core/functions/save_box.dart';
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
        MovieDetailsEntity? movie = localDatasource.getMovie(id);
        return Left(movie);
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

    if (isConnected) {
      final response = await remoteDatasource.getMovies(Endpoints.nowPlaying);
      saveBox(response, HiveBoxCons.nowPlayingMoviesBox);
      return Left(response);
    } else {
      List<MovieEntity>? nowPlayingMovies =
          localDatasource.getMovies(HiveBoxCons.nowPlayingMoviesBox);
      return Left(nowPlayingMovies);
    }
  }

  @override
  Future<Either<List<MovieEntity>, Failure>> getPopularMovies() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      final response =
          await remoteDatasource.getMovies(Endpoints.popularMovies);
      saveBox(response, HiveBoxCons.popularMoviesBox);
      return Left(response);
    } else {
      List<MovieEntity>? popularMovies = localDatasource.getMovies(
        HiveBoxCons.popularMoviesBox,
      );
      return Left(popularMovies);
    }
  }

  @override
  Future<Either<List<MovieEntity>, Failure>> getUpcomingMovies() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      final response = await remoteDatasource.getMovies(
        Endpoints.upcomingMovies,
      );

      saveBox(response, HiveBoxCons.upcomingMoviesBox);
      return Left(response);
    } else {
      List<MovieEntity>? upcomingMovies =
          localDatasource.getMovies(HiveBoxCons.upcomingMoviesBox);
      return Left(upcomingMovies);
    }
  }
}
