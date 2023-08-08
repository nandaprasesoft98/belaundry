import 'package:flutter/material.dart';

import '../domain/entity/category/category.dart';
import '../domain/entity/category/category_list_parameter.dart';
import '../domain/entity/product/all_product_list_parameter.dart';
import '../domain/entity/product/product.dart';
import '../domain/entity/user/user.dart';
import '../domain/entity/user/userinfo/user_info_parameter.dart';
import '../domain/repository/product_repository.dart';
import '../domain/repository/user_repository.dart';
import '../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../misc/load_data_result.dart';
import '../misc/manager/api_request_manager.dart';

class HomeProvider extends ChangeNotifier {
  final HttpClientFutureProcessingCancellationCreator cancellationCreator;
  final ApiRequestManager apiRequestManager;
  final UserRepository userRepository;
  final ProductRepository productRepository;

  LoadDataResult<User> _userLoadDataResult = NoLoadDataResult<User>();
  LoadDataResult<User> get userLoadDataResult => _userLoadDataResult;
  set userLoadDataResult(LoadDataResult<User> value) {
    _userLoadDataResult = value;
    notifyListeners();
  }

  LoadDataResult<List<Category>> _categoryListLoadDataResult = NoLoadDataResult<List<Category>>();
  LoadDataResult<List<Category>> get categoryListLoadDataResult => _categoryListLoadDataResult;
  set categoryListLoadDataResult(LoadDataResult<List<Category>> value) {
    _categoryListLoadDataResult = value;
    notifyListeners();
  }

  LoadDataResult<List<Product>> _latestProductListLoadDataResult = NoLoadDataResult<List<Product>>();
  LoadDataResult<List<Product>> get latestProductListLoadDataResult => _latestProductListLoadDataResult;
  set latestProductListLoadDataResult(LoadDataResult<List<Product>> value) {
    _latestProductListLoadDataResult = value;
    notifyListeners();
  }

  HomeProvider({
    required this.cancellationCreator,
    required this.apiRequestManager,
    required this.userRepository,
    required this.productRepository
  }) {
    _loadUser();
    _loadCategoryList();
    _loadLatestProductList();
  }

  void _loadUser() async {
    userLoadDataResult = IsLoadingLoadDataResult<User>();
    userLoadDataResult = await userRepository.userInfo(UserInfoParameter()).future(
      parameter: apiRequestManager.addRequestToCancellationPart("user", cancellationCreator).value
    );
  }

  void _loadCategoryList() async {
    categoryListLoadDataResult = IsLoadingLoadDataResult<List<Category>>();
    categoryListLoadDataResult = await productRepository.categoryList(CategoryListParameter()).future(
      parameter: apiRequestManager.addRequestToCancellationPart("category-list", cancellationCreator).value
    );
  }

  void _loadLatestProductList() async {
    latestProductListLoadDataResult = IsLoadingLoadDataResult<List<Product>>();
    latestProductListLoadDataResult = await productRepository.allProductList(AllProductListParameter()).future(
      parameter: apiRequestManager.addRequestToCancellationPart("latest-product-list", cancellationCreator).value
    );
  }
}