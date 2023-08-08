import '../../processing/futureprocessingcancellation/httpclientfutureprocessingcancellation/http_client_future_processing_cancellation.dart';
import '../../processing/futureprocessingcancellationcreator/future_processing_cancellation_creator.dart';

abstract class HttpClientFutureProcessingCancellationCreator extends FutureProcessingCancellationCreator<HttpClientFutureProcessingCancellation> {
  HttpClientFutureProcessingCancellation createHttpClientFutureProcessingCancellation();

  @override
  HttpClientFutureProcessingCancellation createFutureProcessingCancellation() {
    return createHttpClientFutureProcessingCancellation();
  }
}