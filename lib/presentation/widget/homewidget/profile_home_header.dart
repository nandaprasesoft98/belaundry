import 'package:belaundry/misc/ext/load_data_result_ext.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/user/user.dart';
import '../../../misc/constant.dart';
import '../../../misc/load_data_result.dart';
import '../modified_shimmer.dart';
import '../modifiedcachednetworkimage/default_modified_cached_network_image.dart';

class ProfileHomeHeader extends StatefulWidget {
  final LoadDataResult<User> userLoadDataResult;

  const ProfileHomeHeader({
    super.key,
    required this.userLoadDataResult
  });

  @override
  State<ProfileHomeHeader> createState() => _ProfileHomeHeaderState();
}

class _ProfileHomeHeaderState extends State<ProfileHomeHeader> {
  @override
  Widget build(BuildContext context) {
    bool isSuccess = widget.userLoadDataResult.isSuccess;
    User? user = widget.userLoadDataResult.resultIfSuccess;
    Color? backgroundColor = isSuccess ? null : Colors.grey;
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Constant.colorGrey2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              Widget widget = Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: isSuccess ? DefaultModifiedCachedNetworkImage(imageUrl: "") : null,
              );
              return isSuccess ? widget : ModifiedShimmer.fromColors(child: widget);
            }
          ),
          const SizedBox(width: 15),
          Builder(
            builder: (context) {
              Widget widget = Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                        fontSize: 10,
                        color: Constant.colorGrey3,
                        backgroundColor: backgroundColor
                      )
                    ),
                    const SizedBox(height: 5),
                    Text(
                      isSuccess ? user!.name : "Sample Loading",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        backgroundColor: backgroundColor,
                        height: 1
                      )
                    ),
                  ],
                ),
              );
              return isSuccess ? widget : ModifiedShimmer.fromColors(child: widget);
            }
          )
        ],
      )
    );
  }
}