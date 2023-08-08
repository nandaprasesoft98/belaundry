import '../../../domain/entity/category/category.dart';
import '../../../domain/entity/category/category_list_parameter.dart';
import '../../../domain/entity/product/find_product_parameter.dart';
import '../../../domain/entity/product/all_product_list_parameter.dart';
import '../../../domain/entity/product/product.dart';
import '../../../domain/entity/product/product_report.dart';
import '../../../domain/entity/product/product_report_parameter.dart';
import '../../../misc/processing/future_processing.dart';

abstract class ProductDataSource {
  FutureProcessing<List<Category>> categoryList(CategoryListParameter categoryListParameter);
  FutureProcessing<List<Product>> allProductList(AllProductListParameter allProductListParameter);
  FutureProcessing<Product> findProduct(FindProductParameter findProductParameter);
  FutureProcessing<List<ProductReport>> productReportList(ProductReportParameter productReportParameter);
}