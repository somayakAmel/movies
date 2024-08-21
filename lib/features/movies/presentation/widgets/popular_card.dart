import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/functions/image_path.dart';
import '../../domain/entities/movie.dart';
import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_events.dart';

Padding popularMovieCard(BuildContext context, {required MovieEntity movie}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: InkWell(
      onTap: () {
        MovieBloc.get(context).add(GetMovie(id: movie.id));
        Navigator.pushNamed(context, Routes.movieDetails);
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imagePath(movie.posterPath),
                height: 200,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    ),
  );
}
