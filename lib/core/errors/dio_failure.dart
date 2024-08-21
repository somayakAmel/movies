import 'package:dio/dio.dart';
import 'package:movies/core/errors/exceptions.dart';

import '../api/status_code.dart';
import 'failure.dart';

class DioFailure extends Failure {
  DioFailure(super.message);

  factory DioFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(error.response!.data['msg']);
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(error.response!.data['status_message']);
          case StatusCode.notFound:
            throw NotFoundException(error.response!.data['msg']);
          case StatusCode.conflict:
            throw const ConflictException(/*error.response!.data['message']*/);
          case StatusCode.internalServer:
            throw const InternalServerErrorException();
          default:
            throw ServerException(error.response!.data['msg']);
        }
      case DioExceptionType.cancel:
        throw const ServerException('Canceled');

      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      default:
        return DioFailure("UnKnown Error");
    }
  }
}
