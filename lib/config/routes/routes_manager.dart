import 'package:flutter/material.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/presentation/screens/home_screen.dart';
import 'package:movies/features/movies/presentation/screens/movie_details_screen.dart';

import '../../features/movies/presentation/screens/all_movies_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class RoutesManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    late Widget screen;

    switch (settings.name) {
      case Routes.splashScreen:
        screen = const SplashScreen();
        break;

      case Routes.homeScreen:
        screen = const HomeScreen();
        break;

      case Routes.movieDetails:
        int id = settings.arguments as int;

        screen = MovieDetailsScreen(
          id: id,
        );
        break;
      case Routes.allMovies:
        FormData data = settings.arguments as FormData;

        screen = AllMoviesScreen(
          data: data,
        );
        break;

      default:
        return unknownRoute(settings);
    }

    return MaterialPageRoute(builder: (context) => screen);
  }

  static Route<dynamic>? unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
