import 'dart:async';

import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  final String _baseUrl;
  final http.Client _client = http.Client();

  HttpClient({required String baseUrl}) : _baseUrl = baseUrl;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request as http.Request;
    final url = request.url.toString().startsWith("/")
        ? Uri.parse("$_baseUrl${request.url}")
        : Uri.parse("${request.url}");
    final newRequest = http.Request(request.method, url);

    newRequest.headers.addAll(request.headers);
    newRequest.encoding = request.encoding;
    newRequest.body = request.body;

    final response = await _client.send(newRequest);

    if (response.statusCode == 401) {
      // do a proper log out
    }

    return response;
  }
}
