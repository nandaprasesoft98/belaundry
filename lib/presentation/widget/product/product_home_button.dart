import 'package:flutter/material.dart';

import '../../../domain/entity/product/product.dart';
import '../modified_shimmer.dart';
import '../modifiedcachednetworkimage/default_modified_cached_network_image.dart';

class ProductHomeButton extends StatelessWidget {
  final Product product;
  final bool isLoading;
  final void Function(Product)? onTap;

  const ProductHomeButton({
    super.key,
    required this.product,
    this.isLoading = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(product) : null,
      child: Container(
        width: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 176 / 214,
          child: SizedBox(
            child: isLoading ? ModifiedShimmer.fromColors(
              child: Container(color: Colors.grey)
            ) : Stack(
              children: [
                DefaultModifiedCachedNetworkImage(imageUrl: product.image)
              ],
            ),
          ),
        )
      ),
    );
  }
}