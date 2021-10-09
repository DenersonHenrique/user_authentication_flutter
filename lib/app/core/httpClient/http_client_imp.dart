import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get({
    required String url,
    Map? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    final response = await client.get(Uri.parse(url));

    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<HttpResponse> post({
    required String url,
    required Map body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    final response = await client.post(
      Uri.parse(url),
      body: jsonEncode(body),
    );

    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
