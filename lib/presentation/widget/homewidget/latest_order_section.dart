import 'package:flutter/material.dart';

import '../../../domain/entity/product/product.dart';
import '../../../misc/load_data_result.dart';

class LatestOrderSection extends StatefulWidget {
  final LoadDataResult<Product> productLoadDataResult;

  const LatestOrderSection({
    super.key,
    required this.productLoadDataResult
  });

  @override
  State<LatestOrderSection> createState() => _LatestOrderSectionState();
}

class _LatestOrderSectionState extends State<LatestOrderSection> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}