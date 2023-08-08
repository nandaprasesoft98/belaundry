import '../httpclient/http_client_response.dart';
import '../response_wrapper.dart';

extension MainStructureResponseWrapperExt on HttpClientResponse<dynamic> {
  MainStructureResponseWrapper wrapResponse() {
    return MainStructureResponseWrapper.factory(data);
  }
}

extension ResponseWrapperExt on ResponseWrapper {
  DefaultResponseWrapper wrapDefaultResponse() {
    return DefaultResponseWrapper(response);
  }
}

extension DoubleResponseWrapperExt on ResponseWrapper {
  double? mapFromResponseToDouble() {
    if (response is int) {
      return (response as int).toDouble();
    } else if (response is double) {
      return response;
    } else if (response is String) {
      return double.tryParse(response);
    } else {
      return response;
    }
  }
}