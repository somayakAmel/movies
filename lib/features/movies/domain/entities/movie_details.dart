import 'package:hive/hive.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 1)
class MovieDetailsEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? overview;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final String? backdropPath;
  @HiveField(5)
  final String? releaseDate;
  @HiveField(6)
  final double? voteAverage;
  @HiveField(7)
  final int? voteCount;
  @HiveField(8)
  final int? runtime;
  @HiveField(9)
  final bool? isAdult;
  @HiveField(10)
  final String? homepage;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.runtime,
    required this.isAdult,
    required this.homepage,
  });
}
