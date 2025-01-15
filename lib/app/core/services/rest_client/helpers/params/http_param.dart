class HttpParam {
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? headers;
  HttpParam({
    required this.url,
    this.body,
    this.headers,
  });
}
