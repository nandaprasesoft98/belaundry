import 'package:flutter/material.dart';

import '../presentation/widget/modified_loading_indicator.dart';

class _DialogHelperImpl {
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Dialog(
            insetPadding: EdgeInsets.zero,
            child: SizedBox(
              width: 100.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Loading..."),
                    SizedBox(
                      height: 12.0,
                    ),
                    ModifiedLoadingIndicator()
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

// ignore: non_constant_identifier_names
final DialogHelper = _DialogHelperImpl();