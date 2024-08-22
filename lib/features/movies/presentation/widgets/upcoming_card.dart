import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/functions/image_path.dart';
import '../../domain/entities/movie.dart';

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
          Navigator.pushNamed(context, Routes.movieDetails,
              arguments: movie.id);
        },
        child: Stack(
          children: [
            SizedBox(
              height: 150,
              width: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: imagePath(movie.posterPath),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
