import 'package:flutter/material.dart';
import 'package:movies/features/movies/presentation/manger/movie_bloc/movie_events.dart';
import '../manger/movie_bloc/movie_bloc.dart';
import '../widgets/now_playing_section.dart';
import '../widgets/popular_section.dart';
import '../widgets/upcoming_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    MovieBloc.get(context).add(GetNowPlaying());
    MovieBloc.get(context).add(GetPopular());
    MovieBloc.get(context).add(GetUpcoming());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 25),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
              ),
              child: Text(
                "Welcome back ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Movies",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const NowPlayingSection(),
            const PopularSection(),
            const UpcomingSection(),
          ],
        ),
      ),
    );
  }
}
