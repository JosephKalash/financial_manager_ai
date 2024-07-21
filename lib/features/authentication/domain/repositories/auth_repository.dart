import 'package:ai_financial_manager/core/logical/abstract/models.dart';
import 'package:ai_financial_manager/core/logical/enums/login_type.dart';

import '../models/auth_params.dart';
import '../models/user.dart';

abstract class IAuthRepository {
  FutureEither<UserModel> login(AuthParams params);
  FutureEither<UserModel> loginSocial(LoginSocialType type);
  FutureEither<UserModel> register(AuthParams params);


  FutureEither<bool> refreshToken();
  FutureEither<UserModel> updateProfile(UserModel newUserModel);
  FutureEither<Map> uploadImage(String path);
  FutureEither<UserModel> getProfile();
  FutureEither<bool> changePassword(AuthParams params);
  FutureEither<bool> changeEmail(AuthParams params);
  FutureEither<bool> resendEmail(AuthParams params);
  FutureEither<bool> resetPassword(String email);
  FutureEither<bool> logout();
  bool tryAutoLogin();
}
