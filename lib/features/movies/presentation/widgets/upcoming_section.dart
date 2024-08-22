import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_state.dart';
import 'package:movies/features/movies/presentation/screens/all_movies_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/colors_cons.dart';
import '../manger/movie_bloc/movie_bloc.dart';
import 'upcoming_card.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) =>
              current is UpcomingMovieLoaded ||
              current is UpcomingMovieError ||
              current is UpcomingMovieLoading,
          builder: (context, state) {
            if (state is UpcomingMovieLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(children: [
                      Text(
                        "Latest Movies",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.allMovies,
                                arguments: FormData(
                                    section: "Latest Movies",
                                    movies: state.movies));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(color: ColorsCons.primaryColor),
                          ))
                    ]),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: state.movies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return UpcomingCard(
                            movie: state.movies[index],
                          );
                        }),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: ColorsCons.shimmerBaseColor,
                        highlightColor: ColorsCons.shimmerHighlightColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Container(
                            width: 300,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        ));
                  },
                ),
              );
            }
          }),
    );
  }
}
