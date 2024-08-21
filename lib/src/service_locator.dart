import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/api_consumer.dart';
import 'package:movies/core/api/dio_consumer.dart';
import 'package:movies/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:movies/features/movies/data/repositories/movie_repo_impl.dart';
import 'package:movies/features/movies/domain/usecases/get_movie_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_upcoming_movies_usecase.dart';
import '../core/api/endpoints.dart';
import '../features/movies/data/datasources/movies_local_datasource.dart';
import '../features/movies/domain/repositories/movies_repositories.dart';

final diInstance = GetIt.instance;

Future<void> setupServiceLocator() async {
  diInstance.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase(diInstance()));

  diInstance.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(diInstance()));
  diInstance.registerLazySingleton<GetUpcomingMoviesUsecase>(
      () => GetUpcomingMoviesUsecase(diInstance()));
  diInstance.registerLazySingleton<GetMovieUsecase>(
      () => GetMovieUsecase(diInstance()));

  diInstance.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
        diInstance(),
        diInstance(),
      ));

  diInstance.registerLazySingleton<MoviesRemoteDatasource>(
      () => MoviesRemoteDatasourceImpl(
            diInstance(),
          ));
  diInstance.registerLazySingleton<MoviesLocalDatasource>(
      () => MoviesLocalDatasourceImpl());

  diInstance.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(dio: diInstance(), baseUrl: Endpoints.baseUrl));
  diInstance.registerLazySingleton(() => Dio());
}
