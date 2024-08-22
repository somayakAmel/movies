import 'package:flutter/material.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';

import '../widgets/movie_card.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({super.key, required this.data});
  final FormData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            data.section,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ListView.builder(
          itemCount: data.movies.length,
          itemBuilder: (context, index) {
            return MovieCard(movie: data.movies[index]);
          },
        ));
  }
}

class FormData {
  final String section;
  final List<MovieEntity> movies;

  FormData({required this.section, required this.movies});
}
