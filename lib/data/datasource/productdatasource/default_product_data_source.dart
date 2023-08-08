import 'package:belaundry/data/entitymappingext/product_entity_mapping_ext.dart';
import 'package:belaundry/misc/ext/future_ext.dart';
import 'package:belaundry/misc/ext/response_wrapper_ext.dart';

import '../../../domain/entity/category/category.dart';
import '../../../domain/entity/category/category_list_parameter.dart';
import '../../../domain/entity/product/find_product_parameter.dart';
import '../../../domain/entity/product/all_product_list_parameter.dart';
import '../../../domain/entity/product/product.dart';
import '../../../domain/entity/product/product_report.dart';
import '../../../domain/entity/product/product_report_parameter.dart';
import '../../../misc/httpclient/httpclient/http_client.dart';
import '../../../misc/processing/future_processing.dart';
import '../../../misc/processing/http_client_future_processing.dart';
import 'product_data_source.dart';

class DefaultProductDataSource implements ProductDataSource {
  final HttpClient httpClient;

  DefaultProductDataSource({
    required this.httpClient
  });

  @override
  FutureProcessing<List<Category>> categoryList(CategoryListParameter getCategoryParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/product/categories", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<List<Category>>(onMap: (value) => value.wrapResponse().mapFromResponseToCategoryList());
    });
  }

  @override
  FutureProcessing<List<Product>> allProductList(AllProductListParameter allProductListParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/product", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<List<Product>>(onMap: (value) => value.wrapResponse().mapFromResponseToProductList());
    });
  }

  @override
  FutureProcessing<Product> findProduct(FindProductParameter findProductParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/product/${findProductParameter.id}", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<Product>(onMap: (value) => value.wrapResponse().mapFromResponseToProduct());
    });
  }

  @override
  FutureProcessing<List<ProductReport>> productReportList(ProductReportParameter productReportParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/product/report", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<List<ProductReport>>(onMap: (value) => value.wrapResponse().mapFromResponseToProductReportList());
    });
  }
}