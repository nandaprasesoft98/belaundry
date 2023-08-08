import 'package:flutter/material.dart';

import '../../../domain/entity/category/category.dart';
import '../../../misc/constant.dart';
import '../modified_shimmer.dart';

class CategoryChipButton extends StatelessWidget {
  final Category category;
  final bool isLoading;
  final void Function(Category)? onTap;

  const CategoryChipButton({
    super.key,
    required this.category,
    this.isLoading = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = isLoading ? Colors.grey : null;
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(category) : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Constant.colorGrey2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Builder(
              builder: (context) {
                Widget widget = Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: isLoading ? null : Image.asset(Constant.imageCategoryIcon),
                );
                return isLoading ? ModifiedShimmer.fromColors(child: widget) : widget;
              }
            ),
            const SizedBox(width: 8),
            Builder(
              builder: (context) {
                Widget widget = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLoading ? "Sample" : category.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Constant.colorGrey4,
                        backgroundColor: backgroundColor,
                        height: 1
                      )
                    ),
                  ],
                );
                return isLoading ? ModifiedShimmer.fromColors(child: widget) : widget;
              }
            )
          ],
        )
      ),
    );
  }
}