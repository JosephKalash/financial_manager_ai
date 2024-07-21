import 'package:ai_financial_manager/core/utils/extensions.dart';
import 'package:ai_financial_manager/core/utils/funcs.dart';
import 'package:ai_financial_manager/core/utils/user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ai_financial_manager/core/logical/enums/login_type.dart';
import '../../../../core/logical/errors/error_model.dart';
import '../../domain/models/user.dart';

import '../../domain/models/auth_params.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _repo;
  AuthCubit(this._repo) : super(const AuthState.initial());

  void reset() {
  }


  Future<void> tryLoginUser() async {
    emit(const AuthState.loading());
    await Future.delayed(1.duration);
    final isLogin = _repo.tryAutoLogin();
    if (isLogin)
      emit(const AuthState.authenticated());
    else
      emit(const AuthState.logout());
  }

  Future<void> loginUser(AuthParams params) async {
    emit(const AuthState.loading());
    final either = await _repo.login(params);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (user) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> loginUserSocial(LoginSocialType type) async {
    emit(const AuthState.loading());
    final either = await _repo.loginSocial(type);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (user) async => emit(const AuthState.authenticated()),
    );
  }

  Future<void> updateProfile(UserModel newUserModel) async {
    emit(const AuthState.loading());
    final either = await _repo.updateProfile(newUserModel);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (_) => emit(const AuthState.updated()),
    );
  }

  Future<void> register(AuthParams params) async {
    emit(const AuthState.loading());
    final either = await _repo.register(params);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (user) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final either = await _repo.logout();
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (user) => emit(const AuthState.logout()),
    );
  }

  Future<bool> refreshToken() async {
    final either = await _repo.refreshToken();
    return either.fold(
      (l) => false,
      (r) => true,
    );
  }

  Future<void> getProfile() async {
    emit(const AuthState.loading());
    final either = await _repo.getProfile();
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (user) => emit(AuthState.gotProfile(user)),
    );
  }

  Future<void> resendEmailVerification(AuthParams params, Function(String) onRes) async {
    final either = await _repo.resendEmail(params);
    either.fold(
      (error) => onRes(getErrorMessage(error)),
      (_) => onRes('email has been resent successfully'),
    );
  }

  void resetPassword(String email) async {
    emit(const AuthState.loading());
    final either = await _repo.resetPassword(email);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (_) => emit(const AuthState.updated()),
    );
  }

  void uploadProfileImage(String path) async {
    emit(const AuthState.loading());
    final either = await _repo.uploadImage(path);
    either.fold(
      (error) => emit(AuthState.error(getErrorMessage(error))),
      (_) => getProfile(),
    );
  }

  void emitGotProfile() async {
    emit(const AuthState.loading());
    await Future.delayed(1.duration);
    emit(AuthState.gotProfile(UserInfo.user!));
  }
}
