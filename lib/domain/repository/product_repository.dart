import '../../misc/load_data_result.dart';
import '../../misc/processing/future_processing.dart';
import '../entity/category/category.dart';
import '../entity/category/category_list_parameter.dart';
import '../entity/product/all_product_list_parameter.dart';
import '../entity/product/find_product_parameter.dart';
import '../entity/product/product.dart';
import '../entity/product/product_report.dart';
import '../entity/product/product_report_parameter.dart';

abstract class ProductRepository {
  FutureProcessing<LoadDataResult<List<Category>>> categoryList(CategoryListParameter categoryListParameter);
  FutureProcessing<LoadDataResult<List<Product>>> allProductList(AllProductListParameter allProductListParameter);
  FutureProcessing<LoadDataResult<Product>> findProduct(FindProductParameter findProductParameter);
  FutureProcessing<LoadDataResult<List<ProductReport>>> productReportList(ProductReportParameter productReportParameter);
}