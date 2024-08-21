abstract class ApiConsumer {
  Future<dynamic> getData(
    String url, {
    Map<String, String>? queryParams,
  });
  Future<dynamic> postData(
    String url,
    dynamic data, {
    Map<String, String>? queryParams,
  });
}
