class ResponseWrapper {
  final dynamic response;

  ResponseWrapper(this.response);
}

class DefaultResponseWrapper extends ResponseWrapper {
  @override
  dynamic get response => _dataResponse;

  late final dynamic _dataResponse;

  DefaultResponseWrapper(dynamic fullResponse) : super(fullResponse) {
    _dataResponse = fullResponse["response"];
  }
}

class MainStructureResponseWrapper extends ResponseWrapper {
  @override
  dynamic get response => _dataResponse;

  late final dynamic _dataResponse;

  late final bool status;
  late final String message;

  factory MainStructureResponseWrapper.factory(dynamic fullResponse) {
    return MainStructureResponseWrapper(fullResponse);
  }

  MainStructureResponseWrapper(dynamic fullResponse) : super(fullResponse) {
    status = fullResponse["status"];
    message = fullResponse["message"];
    _dataResponse = fullResponse;
  }
}