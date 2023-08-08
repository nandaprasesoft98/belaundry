import '../processing/futureprocessingcancellation/httpclientfutureprocessingcancellation/http_client_future_processing_cancellation.dart';
import 'http_client_option.dart';

class HttpClientRequestOption {
  String? method;
  int? sendTimeout;
  int? receiveTimeout;
  Map<String, dynamic>? headers;
  String? contentType;
  dynamic data;
  String path;
  HttpClientFutureProcessingCancellation? httpClientFutureProcessingCancellation;
  ProgressCallback? onReceiveProgress;
  ProgressCallback? onSendProgress;

  HttpClientRequestOption({
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    int? connectTimeout,
    Map<String, dynamic>? headers,
    this.data,
    required this.path,
    Map<String, dynamic>? queryParameters,
    this.onReceiveProgress,
    this.onSendProgress,
    this.httpClientFutureProcessingCancellation,
    String? baseUrl,
  });
}