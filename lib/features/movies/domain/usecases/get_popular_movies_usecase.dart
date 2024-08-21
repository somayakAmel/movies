import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/repositories/movies_repositories.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases.dart';
import '../entities/movie.dart';

class GetPopularMoviesUsecase implements UsecaseNoParam<List<MovieEntity>> {
  MoviesRepository moviesRepository;
  GetPopularMoviesUsecase(this.moviesRepository);
  @override
  Future<Either<List<MovieEntity>, Failure>> call() async {
    return await moviesRepository.getPopularMovies();
  }
}
