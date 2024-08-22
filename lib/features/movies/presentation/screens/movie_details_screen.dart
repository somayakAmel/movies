import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constants/colors_cons.dart';
import 'package:movies/features/movies/presentation/manger/expand_text/expand_text_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../manger/movie_bloc/movie_bloc.dart';
import '../manger/movie_bloc/movie_events.dart';
import '../manger/movie_bloc/movie_state.dart';
import '../widgets/movie_detail_body.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  initState() {
    super.initState();
    MovieBloc.get(context).add(GetMovie(id: widget.id));
    ExpandTextCubit.get(context).reset();
  }

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
          baseColor: ColorsCons.shimmerBaseColor,
          highlightColor: ColorsCons.shimmerHighlightColor,
          child: Stack(
            children: [
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 17,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 17,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 17,
                      ),
                    ])),
              ),
            ],
          ),
        );
      },
    ));
  }
}
