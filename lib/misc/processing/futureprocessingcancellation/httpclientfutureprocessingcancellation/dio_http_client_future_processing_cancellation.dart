import 'package:dio/dio.dart';

import 'http_client_future_processing_cancellation.dart';

class DioHttpClientFutureProcessingCancellation<T> extends HttpClientFutureProcessingCancellation<T> {
  final CancelToken cancelToken;

  DioHttpClientFutureProcessingCancellation({
    required this.cancelToken
  });

  @override
  void cancel([dynamic reason]) {
    cancelToken.cancel(reason);
  }

  @override
  T generateCancelError() => throw UnimplementedError();
}