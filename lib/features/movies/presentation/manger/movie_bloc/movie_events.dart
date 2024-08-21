import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetNowPlaying extends MovieEvent {
  @override
  List<Object?> get props => [];
}

class GetPopular extends MovieEvent {
  @override
  List<Object?> get props => [];
}

class GetUpcoming extends MovieEvent {
  @override
  List<Object?> get props => [];
}

class GetMovie extends MovieEvent {
  final int id;
  const GetMovie({required this.id});
  @override
  List<Object?> get props => [id];
}
