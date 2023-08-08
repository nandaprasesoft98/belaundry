import 'package:dio/dio.dart';

import '../../processing/futureprocessingcancellation/httpclientfutureprocessingcancellation/dio_http_client_future_processing_cancellation.dart';
import '../../processing/futureprocessingcancellation/httpclientfutureprocessingcancellation/http_client_future_processing_cancellation.dart';
import 'http_client_future_processing_cancellation_creator.dart';

class DioHttpClientFutureProcessingCancellationCreator extends HttpClientFutureProcessingCancellationCreator {
  @override
  HttpClientFutureProcessingCancellation createHttpClientFutureProcessingCancellation() {
    return DioHttpClientFutureProcessingCancellation(cancelToken: CancelToken());
  }
}