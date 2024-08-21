import 'package:movies/core/api/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/endpoints.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio, required String baseUrl}) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
  }
  @override
  Future getData(String url, {Map<String, String>? queryParams}) async {
    if (queryParams != null) {
      queryParams.addAll({'api_key': Endpoints.apiKey});
    } else {
      queryParams = {'api_key': Endpoints.apiKey};
    }
    try {
      return await dio.get(url, queryParameters: queryParams);
    } on Exception catch (e) {
      return e;
    }
  }

  @override
  Future postData(String url, data, {Map<String, String>? queryParams}) async {
    if (queryParams != null) {
      queryParams.addAll({'api_key': Endpoints.apiKey});
    } else {
      queryParams = {'api_key': Endpoints.apiKey};
    }
    try {
      return await dio.post(url, data: data);
    } on Exception catch (e) {
      return e;
    }
  }
}
