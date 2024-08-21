import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/manger/expand_text/expand_text_cubit.dart';
import 'package:movies/features/splash/presentation/screens/splash_screen.dart';
import '../config/routes/routes.dart';
import '../config/routes/routes_manager.dart';
import '../config/theme/dark_theme_data.dart';
import '../features/movies/presentation/manger/movie_bloc/movie_bloc.dart';
import '../features/movies/presentation/manger/movie_bloc/movie_events.dart';
import 'service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MovieBloc(
                  diInstance(),
                  diInstance(),
                  diInstance(),
                  diInstance(),
                  dio: diInstance(),
                )
                  ..add((GetNowPlaying()))
                  ..add(GetPopular())
                  ..add(GetUpcoming())),
        BlocProvider(create: (context) => ExpandTextCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        darkTheme: DarkThemeData.theme,
        themeMode: ThemeMode.dark,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RoutesManager.generateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
