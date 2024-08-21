import 'package:dartz/dartz.dart';
import 'package:movies/core/usecases.dart';
import 'package:movies/features/movies/domain/repositories/movies_repositories.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie_details.dart';

class GetMovieUsecase implements Usecase<MovieDetailsEntity?, int> {
  MoviesRepository moviesRepository;
  GetMovieUsecase(this.moviesRepository);
  @override
  Future<Either<MovieDetailsEntity?, Failure>> call(int id) async {
    return await moviesRepository.getMovie(id);
  }
}
