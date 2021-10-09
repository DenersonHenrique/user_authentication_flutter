abstract class IHttpClient {
  Future<HttpResponse> get({
    required String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
  });

  Future<HttpResponse> post({
    required String url,
    required Map body,
    Map<String, dynamic> query,
    Map<String, dynamic> headers,
  });
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({
    this.data,
    required this.statusCode,
  });
}
