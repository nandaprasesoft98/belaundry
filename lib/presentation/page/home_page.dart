import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repository/product_repository.dart';
import '../../domain/repository/user_repository.dart';
import '../../misc/constant.dart';
import '../../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../../misc/injector.dart';
import '../../misc/manager/api_request_manager.dart';
import '../../provider/home_provider.dart';
import '../widget/custom_app_bar.dart';
import '../widget/homewidget/category_carousel_section.dart';
import '../widget/homewidget/latest_product_carousel_section.dart';
import '../widget/homewidget/profile_home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(
        cancellationCreator: Injector.locator<HttpClientFutureProcessingCancellationCreator>(),
        apiRequestManager: Injector.locator<ApiRequestManager>(),
        userRepository: Injector.locator<UserRepository>(),
        productRepository: Injector.locator<ProductRepository>(),
      ),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, __) => Scaffold(
          backgroundColor: Constant.colorRed,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    const CustomAppBar(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: ProfileHomeHeader(userLoadDataResult: homeProvider.userLoadDataResult),
                              ),
                              const SizedBox(height: 16),
                              CategoryCarouselSection(categoryListLoadDataResult: homeProvider.categoryListLoadDataResult),
                              const SizedBox(height: 16),
                              LatestProductCarouselSection(productListLoadDataResult: homeProvider.latestProductListLoadDataResult)
                            ]
                          )
                        )
                      )
                    )
                  ]
                ),
              ]
            ),
          )
        )
      )
    );
  }
}