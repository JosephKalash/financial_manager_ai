import 'package:ai_financial_manager/features/authentication/presentation/pages/forget_password.dart';
import 'package:ai_financial_manager/features/authentication/presentation/pages/login_page.dart';
import 'package:ai_financial_manager/init_page.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});
  @override
  RouteType get defaultRouteType => const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
      ];
}
