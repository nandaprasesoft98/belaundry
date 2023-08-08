import 'package:flutter/material.dart';

import '../domain/repository/product_repository.dart';
import '../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../misc/manager/api_request_manager.dart';

class ProductListProvider extends ChangeNotifier {
  final HttpClientFutureProcessingCancellationCreator cancellationCreator;
  final ApiRequestManager apiRequestManager;
  final ProductRepository productRepository;

  ProductListProvider({
    required this.cancellationCreator,
    required this.apiRequestManager,
    required this.productRepository
  });
}