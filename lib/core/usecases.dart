import 'package:dartz/dartz.dart';
import 'package:movies/core/errors/failure.dart';

abstract class Usecase<T, Param> {
  Future<Either<T, Failure>> call(
    Param params,
  );
}

abstract class UsecaseNoParam<T> {
  Future<Either<T, Failure>> call();
}
