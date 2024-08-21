import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/constants/colors_cons.dart';
import 'package:movies/core/functions/image_path.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_bloc.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_state.dart';

import '../manger/expand_text/expand_text_cubit.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.movieDetails});

  final MovieDetailsEntity? movieDetails;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: ((previous, current) =>
          current is MovieLoaded ||
          current is MovieError ||
          current is MovieLoading),
      builder: (context, state) {
        return Stack(
          children: [
            // Blurred Background Image
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(
                  imagePath(movieDetails!.posterPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Movie Image
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imagePath(movieDetails!.posterPath!),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.fill,
                        )),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.webView,
                                arguments: movieDetails!.homepage);
                          },
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ))
                  ])),
            ),
            // More Info Tile
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsCons.backGroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 4,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movieDetails!.title ?? "Title not available.",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<ExpandTextCubit, ExpandTextState>(
                      builder: (context, state) {
                        bool isExpended =
                            ExpandTextCubit.get(context).isExpended;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              movieDetails!.overview ??
                                  "Overview not available.",
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: isExpended ? 15 : 3,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    ExpandTextCubit.get(context).expandText();
                                  },
                                  child: Text(
                                      isExpended ? "Read less" : "Read more",
                                      style: const TextStyle(
                                          color: Colors.white))),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
