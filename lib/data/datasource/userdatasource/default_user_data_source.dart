import 'package:belaundry/data/entitymappingext/user_entity_mapping_ext.dart';
import 'package:belaundry/misc/ext/future_ext.dart';
import 'package:belaundry/misc/ext/response_wrapper_ext.dart';
import 'package:dio/dio.dart';

import '../../../domain/entity/user/signin/sign_in_parameter.dart';
import '../../../domain/entity/user/signin/sign_in_response.dart';
import '../../../domain/entity/user/signup/sign_up_parameter.dart';
import '../../../domain/entity/user/signup/sign_up_response.dart';
import '../../../domain/entity/user/user.dart';
import '../../../domain/entity/user/userinfo/user_info_parameter.dart';
import '../../../misc/httpclient/httpclient/http_client.dart';
import '../../../misc/processing/future_processing.dart';
import '../../../misc/processing/http_client_future_processing.dart';
import 'user_data_source.dart';

class DefaultUserDataSource implements UserDataSource {
  final HttpClient httpClient;

  DefaultUserDataSource({
    required this.httpClient
  });

  @override
  FutureProcessing<SignInResponse> signIn(SignInParameter signInParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      dynamic data = {"email": signInParameter.email, "password": signInParameter.password};
      return httpClient.post("/user/sign-in", data: data, httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<SignInResponse>(onMap: (value) => value.wrapResponse().mapFromResponseToSignInResponse());
    });
  }

  @override
  FutureProcessing<SignUpResponse> signUp(SignUpParameter signUpParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/user/sign-up", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<SignUpResponse>(onMap: (value) => value.wrapResponse().mapFromResponseToSignUpResponse());
    });
  }

  @override
  FutureProcessing<User> userInfo(UserInfoParameter userInfoParameter) {
    return HttpClientFutureProcessing((httpClientFutureProcessingCancellation) {
      return httpClient.get("/user/info", httpClientFutureProcessingCancellation: httpClientFutureProcessingCancellation)
        .map<User>(onMap: (value) => value.wrapResponse().mapFromResponseToUser());
    });
  }
}