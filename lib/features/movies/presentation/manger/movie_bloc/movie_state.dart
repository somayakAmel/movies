import 'package:equatable/equatable.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';

import '../../../domain/entities/movie_details.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

// Popular movies

class PopularMovieLoading extends MovieState {}

class PopularMovieLoaded extends MovieState {
  final List<MovieEntity> movies;

  const PopularMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularMovieError extends MovieState {
  final String message;

  const PopularMovieError(this.message);

  @override
  List<Object> get props => [message];
}

// Upcoming movies
class UpcomingMovieLoading extends MovieState {}

class UpcomingMovieLoaded extends MovieState {
  final List<MovieEntity> movies;

  const UpcomingMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class UpcomingMovieError extends MovieState {
  final String message;

  const UpcomingMovieError(this.message);

  @override
  List<Object> get props => [message];
}

// Now playing
class NowPlayingMovieLoading extends MovieState {}

class NowPlayingMovieLoaded extends MovieState {
  final List<MovieEntity> movies;

  const NowPlayingMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingMovieError extends MovieState {
  final String message;

  const NowPlayingMovieError(this.message);

  @override
  List<Object> get props => [message];
}

// Movie
class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieDetailsEntity? movie;

  const MovieLoaded(this.movie);

  @override
  List<Object> get props => [movie ?? ""];
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}
