// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:ai_financial_manager/features/authentication/presentation/pages/forget_password.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../features/authentication/presentation/pages/login_page.dart';
import '../../../init_page.dart';


@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: ForgetPasswordPage),
  ],
)
class $AppRouter {}
