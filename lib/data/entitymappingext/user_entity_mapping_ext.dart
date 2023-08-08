import 'package:belaundry/misc/ext/response_wrapper_ext.dart';

import '../../domain/entity/user/signin/sign_in_response.dart';
import '../../domain/entity/user/signup/sign_up_response.dart';
import '../../domain/entity/user/user.dart';
import '../../misc/response_wrapper.dart';

extension UserDetailEntityMappingExt on ResponseWrapper {
  SignUpResponse mapFromResponseToSignUpResponse() {
    return SignUpResponse(
      token: response["token"]
    );
  }

  SignInResponse mapFromResponseToSignInResponse() {
    return SignInResponse(
      token: wrapDefaultResponse().response
    );
  }

  User mapFromResponseToUser() {
    dynamic userResponse = wrapDefaultResponse().response;
    return User(
      id: userResponse["id"],
      name: userResponse["name"]
    );
  }
}