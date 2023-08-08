import '../futureprocessingcancellation/future_processing_cancellation.dart';

abstract class FutureProcessingCancellationCreator<T extends FutureProcessingCancellation> {
  T createFutureProcessingCancellation();
}