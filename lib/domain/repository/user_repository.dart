import '../../misc/load_data_result.dart';
import '../../misc/processing/future_processing.dart';
import '../entity/user/signin/sign_in_parameter.dart';
import '../entity/user/signin/sign_in_response.dart';
import '../entity/user/signup/sign_up_parameter.dart';
import '../entity/user/signup/sign_up_response.dart';
import '../entity/user/user.dart';
import '../entity/user/userinfo/user_info_parameter.dart';

abstract class UserRepository {
  FutureProcessing<LoadDataResult<SignInResponse>> signIn(SignInParameter signInParameter);
  FutureProcessing<LoadDataResult<SignUpResponse>> signUp(SignUpParameter signUpParameter);
  FutureProcessing<LoadDataResult<User>> userInfo(UserInfoParameter userInfoParameter);
}