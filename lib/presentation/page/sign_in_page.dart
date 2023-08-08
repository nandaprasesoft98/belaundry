import 'package:belaundry/misc/ext/load_data_result_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/user/signin/sign_in_parameter.dart';
import '../../domain/repository/user_repository.dart';
import '../../misc/constant.dart';
import '../../misc/dialog_helper.dart';
import '../../misc/error/http_client_error.dart';
import '../../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../../misc/injector.dart';
import '../../misc/login_helper.dart';
import '../../misc/manager/api_request_manager.dart';
import '../../provider/sign_in_provider.dart';
import '../widget/modified_svg_picture.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscuredPasswordText = true;
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInProvider(
        cancellationCreator: Injector.locator<HttpClientFutureProcessingCancellationCreator>(),
        apiRequestManager: Injector.locator<ApiRequestManager>(),
        userRepository: Injector.locator<UserRepository>()
      )..loginProviderDelegate = LoginProviderDelegate(
        showLoadingDialog: () => DialogHelper.showLoadingDialog(context),
        popRoute: () => Navigator.of(context).pop(),
        unfocus: () => FocusScope.of(context).unfocus(),
        saveToken: (token) async => await LoginHelper.saveToken(token).future(),
        afterSignInProcess: (signInResponseLoadDataResult) {
          if (signInResponseLoadDataResult.isFailed) {
            String message = "";
            if (signInResponseLoadDataResult.resultIfFailed is HttpClientError) {
              message = (signInResponseLoadDataResult.resultIfFailed as HttpClientError).message;
            } else {
              message = signInResponseLoadDataResult.resultIfFailed;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Constant.colorRed,
              )
            );
            return;
          }
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
        }
      ),
      child: Consumer<SignInProvider>(
        builder: (context, signInProvider, __) => Scaffold(
          backgroundColor: Constant.colorBlue2,
          body: Stack(
            children: [
              ModifiedSvgPicture.asset(Constant.vectorLoginScenery, color: Constant.colorBlue3),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Be Laundry',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Sign in to Your Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                            fontWeight: FontWeight.w600,
                            height: 1
                          )
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'To enter our app, you must sign in first',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.63),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
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
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 12,
                                color: Constant.colorBlue2
                              )
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Constant.colorGrey),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: TextField(
                                style: const TextStyle(fontSize: 12),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextEditingController,
                                decoration: const InputDecoration.collapsed(
                                  hintText: "Type Email",
                                ).copyWith(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                                ),
                              )
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 12,
                                color: Constant.colorBlue2
                              )
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Constant.colorGrey),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      style: const TextStyle(fontSize: 12),
                                      controller: _passwordTextEditingController,
                                      obscureText: _isObscuredPasswordText,
                                      obscuringCharacter: "*",
                                      decoration: const InputDecoration.collapsed(
                                        hintText: "Type Password"
                                      ).copyWith(
                                        contentPadding: const EdgeInsets.only(left: 16, right: 0, top: 12, bottom: 12)
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () => setState(() => _isObscuredPasswordText = !_isObscuredPasswordText),
                                    child: Transform.flip(
                                      flipX: true,
                                      child: Icon(_isObscuredPasswordText ? Icons.visibility_off : Icons.visibility)
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              )
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                ),
                                onPressed: () => signInProvider.signIn(
                                  signInParameter: SignInParameter(
                                    email: _emailTextEditingController.text,
                                    password: _passwordTextEditingController.text
                                  )
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                  )
                                ),
                              ),
                            )
                          ]
                        )
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      )
    );
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}