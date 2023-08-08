import 'package:belaundry/misc/ext/load_data_result_ext.dart';
import 'package:flutter/material.dart';

import '../domain/entity/user/signin/sign_in_parameter.dart';
import '../domain/entity/user/signin/sign_in_response.dart';
import '../domain/repository/user_repository.dart';
import '../misc/httpclient/httpclientfutureprocessingcancellationcreator/http_client_future_processing_cancellation_creator.dart';
import '../misc/load_data_result.dart';
import '../misc/manager/api_request_manager.dart';

class SignInProvider extends ChangeNotifier {
  final HttpClientFutureProcessingCancellationCreator cancellationCreator;
  final ApiRequestManager apiRequestManager;
  final UserRepository userRepository;

  LoginProviderDelegate? _loginProviderDelegate;
  set loginProviderDelegate(LoginProviderDelegate value) => _loginProviderDelegate = value;

  SignInProvider({
    required this.cancellationCreator,
    required this.apiRequestManager,
    required this.userRepository
  });

  void signIn({
    required SignInParameter signInParameter
  }) async {
    if (_loginProviderDelegate != null) {
      _loginProviderDelegate!.unfocus();
      _loginProviderDelegate!.showLoadingDialog();
      LoadDataResult<SignInResponse> signInResponseLoadDataResult = await userRepository.signIn(signInParameter).future(
        parameter: apiRequestManager.addRequestToCancellationPart("sign-in", cancellationCreator).value
      );
      if (signInResponseLoadDataResult.isSuccess) {
        _loginProviderDelegate!.saveToken(signInResponseLoadDataResult.resultIfSuccess!.token);
      }
      _loginProviderDelegate!.popRoute();
      _loginProviderDelegate!.afterSignInProcess(signInResponseLoadDataResult);
    }
  }
}

class LoginProviderDelegate {
  final void Function() showLoadingDialog;
  final void Function() popRoute;
  final void Function() unfocus;
  final Future<void> Function(String) saveToken;
  final void Function(LoadDataResult<SignInResponse>) afterSignInProcess;

  LoginProviderDelegate({
    required this.showLoadingDialog,
    required this.popRoute,
    required this.unfocus,
    required this.saveToken,
    required this.afterSignInProcess
  });
}