import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/core/functions/image_path.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_bloc.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_events.dart';

import '../../../../config/routes/routes.dart';

class NowPlayingMovieCard extends StatelessWidget {
  const NowPlayingMovieCard({
    super.key,
    required this.movie,
  });
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MovieBloc.get(context).add(GetMovie(id: movie.id));
        Navigator.pushNamed(context, Routes.movieDetails);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          width: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background Image
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    imagePath(movie.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay Color
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
                // Blur Filter
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                // Foreground Content
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left-side Content
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.red[500],
                                  ),
                                  Text(
                                    "Now Playing  ",
                                    style: TextStyle(
                                      color: Colors.red[500],
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              movie.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              movie.overview,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right-side Image
                    Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          imagePath(movie.posterPath),
                          fit: BoxFit.cover,
                          height:
                              200, // Ensures the image fits within the defined height
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
