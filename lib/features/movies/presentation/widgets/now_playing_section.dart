import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constants/colors_cons.dart';

import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_state.dart';
import '../widgets/now_playing_card.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.8);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (previous, current) =>
            current is NowPlayingMovieLoaded ||
            current is NowPlayingMovieError ||
            current is NowPlayingMovieLoading,
        builder: (context, state) {
          if (state is NowPlayingMovieLoaded) {
            return SizedBox(
                height: 200,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final item = state.movies[index];
                      return AnimatedBuilder(
                          animation: pageController,
                          builder: (context, child) {
                            return NowPlayingMovieCard(movie: item);
                          });
                    }));
          } else {
            return SizedBox(
              height: 200,
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
                          width: 350,
                          height: 200,
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
        },
      ),
    );
  }
}
