import 'package:belaundry/misc/ext/load_data_result_ext.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/product/product.dart';
import '../../../misc/constant.dart';
import '../../../misc/load_data_result.dart';
import '../product/product_home_button.dart';

class LatestProductCarouselSection extends StatefulWidget {
  final LoadDataResult<List<Product>> productListLoadDataResult;

  const LatestProductCarouselSection({
    super.key,
    required this.productListLoadDataResult
  });

  @override
  State<LatestProductCarouselSection> createState() => _LatestProductCarouselSectionState();
}

class _LatestProductCarouselSectionState extends State<LatestProductCarouselSection> {
  @override
  Widget build(BuildContext context) {
    bool isSuccess = widget.productListLoadDataResult.isSuccess;
    List<Product> productList = isSuccess ? widget.productListLoadDataResult.resultIfSuccess! : <Product>[
      Product(
        id: 1,
        name: "Sample 1",
        description: "",
        stock: 0,
        categoryId: "",
        price: 0,
        userId: 1,
        image: "",
        active: 1,
        sku: ""
      ),
      Product(
        id: 2,
        name: "Sample 2",
        description: "",
        stock: 0,
        categoryId: "",
        price: 0,
        userId: 1,
        image: "",
        active: 1,
        sku: ""
      ),
      Product(
        id: 3,
        name: "Sample 3",
        description: "",
        stock: 0,
        categoryId: "",
        price: 0,
        userId: 1,
        image: "",
        active: 1,
        sku: ""
      )
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Our Latest Products",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Constant.colorBlue4
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productList.mapIndexed(
              (index, product) => Row(
                children: [
                  if (index > 0) const SizedBox(width: 10),
                  ProductHomeButton(
                    product: product,
                    isLoading: !isSuccess,
                    onTap: (product) {

                    },
                  ),
                ],
              )
            ).toList(),
          ),
        ),
      ],
    );
  }
}