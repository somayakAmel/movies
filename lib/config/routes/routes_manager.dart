import 'package:flutter/material.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/features/movies/presentation/screens/home_screen.dart';
import 'package:movies/features/movies/presentation/screens/movie_details_screen.dart';

import '../../features/movies/presentation/screens/web_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class RoutesManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (context) => const MovieDetailsScreen(),
        );
      case Routes.webView:
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VideoWebView(
            url: url,
          ),
        );

      default:
        return unknownRoute(settings);
    }
  }

  static Route<dynamic>? unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
