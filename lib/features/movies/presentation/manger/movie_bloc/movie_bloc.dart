import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_movies_usecase.dart';

import '../../../domain/usecases/get_movie_usecase.dart';
import '../../../domain/usecases/get_upcoming_movies_usecase.dart';
import 'movie_events.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final Dio dio;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUsecase,
      this.getUpcomingMoviesUseCase, this.getMovieUsecase,
      {required this.dio})
      : super(MovieInitial()) {
    on<GetNowPlaying>(getNowPlaying);
    on<GetPopular>(getPopular);
    on<GetUpcoming>(getUpcoming);
    on<GetMovie>(getMovie);
  }
  static MovieBloc get(context) => BlocProvider.of(context);

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetUpcomingMoviesUsecase getUpcomingMoviesUseCase;
  final GetMovieUsecase getMovieUsecase;

  Future<void> getNowPlaying(
      GetNowPlaying event, Emitter<MovieState> emit) async {
    emit(NowPlayingMovieLoading());
    final result = await getNowPlayingMoviesUseCase.call();
    result.fold((r) => emit(NowPlayingMovieLoaded(r)),
        (l) => emit(NowPlayingMovieError(l.message)));
  }

  Future<void> getPopular(GetPopular event, Emitter<MovieState> emit) async {
    emit(PopularMovieLoading());
    final result = await getPopularMoviesUsecase.call();
    result.fold((r) => emit(PopularMovieLoaded(r)),
        (l) => emit(PopularMovieError(l.message)));
  }

  Future<void> getUpcoming(GetUpcoming event, Emitter<MovieState> emit) async {
    emit(UpcomingMovieLoading());
    final result = await getUpcomingMoviesUseCase.call();
    result.fold((r) => emit(UpcomingMovieLoaded(r)),
        (l) => emit(UpcomingMovieError(l.message)));
  }

  Future<void> getMovie(GetMovie event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final result = await getMovieUsecase.call(event.id);
    result.fold(
        (r) => emit(MovieLoaded(r)), (l) => emit(MovieError(l.message)));
  }
}
