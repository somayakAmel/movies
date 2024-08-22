import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/functions/image_path.dart';
import '../../domain/entities/movie.dart';

Padding popularMovieCard(BuildContext context, {required MovieEntity movie}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetails, arguments: movie.id);
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imagePath(movie.posterPath),
                  height: 200,
                  width: 120,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
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
