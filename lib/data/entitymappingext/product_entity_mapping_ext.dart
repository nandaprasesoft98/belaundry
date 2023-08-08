import 'package:belaundry/misc/ext/response_wrapper_ext.dart';

import '../../domain/entity/category/category.dart';
import '../../domain/entity/product/product.dart';
import '../../domain/entity/product/product_report.dart';
import '../../misc/response_wrapper.dart';

extension ProductEntityMappingExt on ResponseWrapper {
  List<Category> mapFromResponseToCategoryList() {
    return wrapDefaultResponse().response.map<Category>(
      (categoryResponse) => ResponseWrapper(categoryResponse).mapFromResponseToCategory()
    ).toList();
  }

  List<Product> mapFromResponseToProductList() {
    return wrapDefaultResponse().response.map<Product>(
      (productResponse) => ResponseWrapper(productResponse).mapFromResponseToProduct()
    ).toList();
  }

  List<ProductReport> mapFromResponseToProductReportList() {
    return wrapDefaultResponse().response.map<ProductReport>(
      (productReportResponse) => ResponseWrapper(productReportResponse).mapFromResponseToProductReport()
    ).toList();
  }
}

extension ProductDetailEntityMappingExt on ResponseWrapper {
  Category mapFromResponseToCategory() {
    dynamic categoryResponse = response;
    return Category(
      id: categoryResponse["id"],
      name: categoryResponse["name"],
    );
  }

  Product mapFromResponseToProduct() {
    dynamic productResponse = response;
    return Product(
      id: productResponse["id"],
      name: productResponse["name"],
      description: productResponse["description"],
      sku: productResponse["sku"],
      stock: productResponse["stock"],
      categoryId: productResponse["category_id"],
      price: productResponse["price"] ?? 0,
      userId: productResponse["user_id"],
      image: productResponse["image"],
      active: productResponse["active"]
    );
  }

  ProductReport mapFromResponseToProductReport() {
    dynamic productResponse = response;
    return ProductReport(
      total: productResponse["id"],
      income: ResponseWrapper(productResponse["income"]).mapFromResponseToDouble()!,
      createdAt: productResponse["description"],
    );
  }
}