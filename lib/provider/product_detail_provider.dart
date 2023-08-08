import 'package:flutter/material.dart';

import '../domain/entity/product/product.dart';
import '../domain/repository/product_repository.dart';
import '../misc/load_data_result.dart';

import '../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../misc/load_data_result.dart';
import '../misc/manager/api_request_manager.dart';

class ProductDetailProvider extends ChangeNotifier {
  final HttpClientFutureProcessingCancellationCreator cancellationCreator;
  final ApiRequestManager apiRequestManager;
  final ProductRepository productRepository;

  ProductDetailProvider({
    required this.cancellationCreator,
    required this.apiRequestManager,
    required this.productRepository
  });

  LoadDataResult<Product> _productDetailListLoadDataResult = NoLoadDataResult<Product>();
  LoadDataResult<Product> get productDetailListLoadDataResult => _productDetailListLoadDataResult;
  set productDetailListLoadDataResult(LoadDataResult<Product> value) {
    _productDetailListLoadDataResult = value;
    notifyListeners();
  }
}