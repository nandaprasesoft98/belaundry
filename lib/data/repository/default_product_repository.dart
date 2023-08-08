import '../../domain/entity/category/category.dart';
import '../../domain/entity/category/category_list_parameter.dart';
import '../../domain/entity/product/all_product_list_parameter.dart';
import '../../domain/entity/product/find_product_parameter.dart';
import '../../domain/entity/product/product.dart';
import '../../domain/entity/product/product_report.dart';
import '../../domain/entity/product/product_report_parameter.dart';
import '../../domain/repository/product_repository.dart';
import '../../misc/load_data_result.dart';
import '../../misc/processing/future_processing.dart';
import '../datasource/productdatasource/product_data_source.dart';

class DefaultProductRepository implements ProductRepository {
  final ProductDataSource productDataSource;

  DefaultProductRepository({
    required this.productDataSource
  });

  @override
  FutureProcessing<LoadDataResult<List<Product>>> allProductList(AllProductListParameter allProductListParameter) {
    return productDataSource.allProductList(allProductListParameter).mapToLoadDataResult();
  }

  @override
  FutureProcessing<LoadDataResult<List<Category>>> categoryList(CategoryListParameter categoryListParameter) {
    return productDataSource.categoryList(categoryListParameter).mapToLoadDataResult();
  }

  @override
  FutureProcessing<LoadDataResult<Product>> findProduct(FindProductParameter findProductParameter) {
    return productDataSource.findProduct(findProductParameter).mapToLoadDataResult();
  }

  @override
  FutureProcessing<LoadDataResult<List<ProductReport>>> productReportList(ProductReportParameter productReportParameter) {
    return productDataSource.productReportList(productReportParameter).mapToLoadDataResult();
  }
}