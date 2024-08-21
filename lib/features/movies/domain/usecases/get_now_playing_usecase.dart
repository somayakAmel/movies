import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/repositories/movies_repositories.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase implements UsecaseNoParam<List<MovieEntity>> {
  MoviesRepository moviesRepository;
  GetNowPlayingMoviesUseCase(this.moviesRepository);
  @override
  Future<Either<List<MovieEntity>, Failure>> call() async {
    return await moviesRepository.getNowPlaying();
  }
}
