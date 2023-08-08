import 'package:get_it/get_it.dart';

import '../data/datasource/productdatasource/default_product_data_source.dart';
import '../data/datasource/productdatasource/product_data_source.dart';
import '../data/datasource/userdatasource/default_user_data_source.dart';
import '../data/datasource/userdatasource/user_data_source.dart';
import '../data/repository/default_product_repository.dart';
import '../data/repository/default_user_repository.dart';
import '../domain/repository/product_repository.dart';
import '../domain/repository/user_repository.dart';
import 'httpclient/httpclient/diohttpclient/dio_http_client.dart';
import 'httpclient/httpclient/diohttpclient/dio_http_client_part.dart';
import 'httpclient/httpclient/http_client.dart';
import 'httpclient/httpclientfutureprocessingcancellationcreator/dio_http_client_future_processing_cancellation_creator.dart';
import 'httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import 'manager/api_request_manager.dart';

class _Injector {
  final GetIt locator = GetIt.instance;

  void init() {
    // Repository
    locator.registerLazySingleton<ProductRepository>(() => DefaultProductRepository(productDataSource: locator()));
    locator.registerLazySingleton<UserRepository>(() => DefaultUserRepository(userDataSource: locator()));

    // Data Sources
    locator.registerLazySingleton<ProductDataSource>(() => DefaultProductDataSource(httpClient: locator()));
    locator.registerLazySingleton<UserDataSource>(() => DefaultUserDataSource(httpClient: locator()));

    // Http Client
    locator.registerLazySingleton<HttpClient>(() => DioHttpClient(dio: ModifiedDio(locator<DioHttpClientCreator>().createDio())));

    // Http Client Future Processing Cancellation Creator
    locator.registerLazySingleton<HttpClientFutureProcessingCancellationCreator>(() => DioHttpClientFutureProcessingCancellationCreator());

    // Dio Http Client Creator
    locator.registerFactory<DioHttpClientCreator>(() => DioHttpClientCreator());

    // Api Request Manager
    locator.registerFactory<ApiRequestManager>(() => ApiRequestManager());
  }
}

// ignore: non_constant_identifier_names
final Injector = _Injector();