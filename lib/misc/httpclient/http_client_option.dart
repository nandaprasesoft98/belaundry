typedef ProgressCallback = void Function(int count, int total);

class HttpClientOption {
  String? method;
  int? sendTimeout;
  int? receiveTimeout;
  Map<String, dynamic>? headers;
  String? contentType;

  HttpClientOption({
    this.method,
    this.sendTimeout,
    this.receiveTimeout,
    this.headers,
    this.contentType,
  });
}