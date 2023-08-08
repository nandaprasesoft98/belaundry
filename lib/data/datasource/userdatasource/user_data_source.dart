import '../../../domain/entity/user/signin/sign_in_parameter.dart';
import '../../../domain/entity/user/signin/sign_in_response.dart';
import '../../../domain/entity/user/signup/sign_up_parameter.dart';
import '../../../domain/entity/user/signup/sign_up_response.dart';
import '../../../domain/entity/user/user.dart';
import '../../../domain/entity/user/userinfo/user_info_parameter.dart';
import '../../../misc/processing/future_processing.dart';

abstract class UserDataSource {
  FutureProcessing<SignInResponse> signIn(SignInParameter signInParameter);
  FutureProcessing<SignUpResponse> signUp(SignUpParameter signUpParameter);
  FutureProcessing<User> userInfo(UserInfoParameter userInfoParameter);
}