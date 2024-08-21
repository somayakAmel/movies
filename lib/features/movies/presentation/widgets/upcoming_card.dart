import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/functions/image_path.dart';
import '../../domain/entities/movie.dart';
import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_events.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({
    super.key,
    required this.movie,
  });
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          MovieBloc.get(context).add(GetMovie(id: movie.id));
          Navigator.pushNamed(context, Routes.movieDetails);
        },
        child: Stack(
          children: [
            SizedBox(
              height: 150,
              width: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image(
                  image: NetworkImage(
                    imagePath(movie.backdropPath),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
