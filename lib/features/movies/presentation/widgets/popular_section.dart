import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constants/colors_cons.dart';
import 'package:movies/features/movies/presentation/widgets/popular_card.dart';
import 'package:shimmer/shimmer.dart';
import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_state.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(children: [
            Text(
              "Popular Movies",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(color: ColorsCons.primaryColor),
                ))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<MovieBloc, MovieState>(
            buildWhen: (previous, current) =>
                current is PopularMovieLoaded ||
                current is PopularMovieError ||
                current is PopularMovieLoading,
            builder: (context, state) {
              if (state is PopularMovieLoaded) {
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return popularMovieCard(context,
                            movie: state.movies[index]);
                      }),
                );
              } else {
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[400]!,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )));
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
