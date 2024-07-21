
import 'package:ai_financial_manager/core/utils/user_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ai_financial_manager/core/logical/enums/login_type.dart';
import '../../../../core/logical/urls.dart';
import '../../domain/models/auth_params.dart';
import '../../domain/models/user.dart';

abstract class IAuthRemoteDS {
  Future<UserModel> loginUser(AuthParams params);
  Future<UserModel> register(AuthParams params);
  Future<UserModel> loginUserSocial(LoginSocialType type);
  Future<bool> logout();
  Future<bool> resetPassword(String email);
  Future<UserModel> getProfile();
  Future<UserModel> updateProfile(UserModel newUserModel);
  Future<Map> uploadImage(String path);
  Future<bool> changeEmail(AuthParams params);
  Future<bool> changePassword(AuthParams params);
  Future<bool> resendEmail(AuthParams params);
  Future refreshToken();
}

@LazySingleton(as: IAuthRemoteDS)
class AuthRemoteDataSourceImpl extends IAuthRemoteDS {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> loginUser(AuthParams params) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() async {
    try {} on Exception catch (_) {}
    return true;
  }

  @override
  Future<UserModel> register(AuthParams params) async {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getProfile() async {
    final res = await dio.get(profileUrl);
    final data = (res.data as List)[0];

    final userModel = UserModel.fromJson(data);
    return userModel;
  }

  @override
  Future<UserModel> updateProfile(UserModel newUserModel) async {
    await dio.patch(
      '$profileUrl${UserInfo.user!.id}/',
      data: newUserModel.toJson(),
    );
    return newUserModel;
  }

  @override
  Future<bool> changeEmail(AuthParams params) async {
    return true;
  }

  @override
  Future<bool> changePassword(AuthParams params) async {
    return true;
  }

  @override
  Future<bool> resendEmail(AuthParams params) async {
    return true;
  }

  @override
  Future refreshToken() async {}

  @override
  Future<UserModel> loginUserSocial(LoginSocialType type) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) async {
    return true;
  }

  @override
  Future<Map> uploadImage(String path) async {
    // final formData = FormData.fromMap({
    //   'image': await MultipartFile.fromFile(path),
    // });
    // final res = await dio.post(profileImageUrl, data: formData);
    // return res.data;
    throw UnimplementedError();
  }
}
