import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_state.dart';
import '../widgets/movie_detail_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          current is MovieLoaded ||
          current is MovieError ||
          current is MovieLoading,
      builder: (context, state) {
        if (state is MovieLoaded) {
          return MovieDetailsBody(movieDetails: state.movie);
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[400]!,
          child: Stack(
            children: [
              // Movie Image
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    )),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
