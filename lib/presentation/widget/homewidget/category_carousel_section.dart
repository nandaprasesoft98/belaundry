import 'package:belaundry/misc/ext/load_data_result_ext.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/category/category.dart';
import '../../../misc/load_data_result.dart';
import '../category/category_chip_button.dart';

class CategoryCarouselSection extends StatefulWidget {
  final LoadDataResult<List<Category>> categoryListLoadDataResult;

  const CategoryCarouselSection({
    super.key,
    required this.categoryListLoadDataResult
  });

  @override
  State<CategoryCarouselSection> createState() => _CategoryCarouselSectionState();
}

class _CategoryCarouselSectionState extends State<CategoryCarouselSection> {
  @override
  Widget build(BuildContext context) {
    bool isSuccess = widget.categoryListLoadDataResult.isSuccess;
    List<Category> categoryList = isSuccess ? widget.categoryListLoadDataResult.resultIfSuccess! : <Category>[
      Category(
        id: 1,
        name: "Sample 1"
      ),
      Category(
        id: 2,
        name: "Sample 2"
      ),
      Category(
        id: 3,
        name: "Sample 3"
      )
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryList.mapIndexed(
          (index, category) => Row(
            children: [
              if (index > 0) const SizedBox(width: 10),
              CategoryChipButton(
                category: category,
                isLoading: !isSuccess,
                onTap: (category) {

                },
              ),
            ],
          )
        ).toList(),
      ),
    );
  }
}