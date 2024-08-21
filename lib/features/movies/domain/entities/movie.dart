import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String posterPath;
  @HiveField(4)
  final String backdropPath;
  @HiveField(5)
  final double rating;
  @HiveField(6)
  final String releaseDate;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      rating: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
