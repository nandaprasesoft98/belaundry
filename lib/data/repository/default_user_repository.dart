import '../../domain/entity/user/signin/sign_in_parameter.dart';
import '../../domain/entity/user/signin/sign_in_response.dart';
import '../../domain/entity/user/signup/sign_up_parameter.dart';
import '../../domain/entity/user/signup/sign_up_response.dart';
import '../../domain/entity/user/user.dart';
import '../../domain/entity/user/userinfo/user_info_parameter.dart';
import '../../domain/repository/user_repository.dart';
import '../../misc/load_data_result.dart';
import '../../misc/processing/future_processing.dart';
import '../datasource/userdatasource/user_data_source.dart';

class DefaultUserRepository implements UserRepository {
  final UserDataSource userDataSource;

  DefaultUserRepository({
    required this.userDataSource
  });

  @override
  FutureProcessing<LoadDataResult<SignInResponse>> signIn(SignInParameter signInParameter) {
    return userDataSource.signIn(signInParameter).mapToLoadDataResult();
  }

  @override
  FutureProcessing<LoadDataResult<SignUpResponse>> signUp(SignUpParameter signUpParameter) {
    return userDataSource.signUp(signUpParameter).mapToLoadDataResult();
  }

  @override
  FutureProcessing<LoadDataResult<User>> userInfo(UserInfoParameter userInfoParameter) {
    return userDataSource.userInfo(userInfoParameter).mapToLoadDataResult();
  }
}