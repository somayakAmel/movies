import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/constants/hive_box_cons.dart';
import 'package:movies/src/service_locator.dart';

import 'features/movies/domain/entities/movie.dart';
import 'features/movies/domain/entities/movie_details.dart';
import 'src/app.dart';
import 'src/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  Hive.registerAdapter(MovieDetailsEntityAdapter());
  await Hive.openBox(HiveBoxCons.nowPlayingMoviesBox);
  await Hive.openBox(HiveBoxCons.popularMoviesBox);
  await Hive.openBox(HiveBoxCons.upcomingMoviesBox);
  await Hive.openBox(HiveBoxCons.movieDetailsBox);

  runApp(const MyApp());
}
