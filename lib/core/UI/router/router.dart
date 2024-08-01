import 'package:ai_financial_manager/features/ai/presentation/pages/ai_page.dart';
import 'package:ai_financial_manager/features/authentication/presentation/pages/forget_password.dart';
import 'package:ai_financial_manager/features/authentication/presentation/pages/login_page.dart';
import 'package:ai_financial_manager/features/plans/presentation/pages/plans_page.dart';
import 'package:ai_financial_manager/features/record/presentation/pages/main_page.dart';
import 'package:ai_financial_manager/features/record/presentation/pages/records_page.dart';
import 'package:ai_financial_manager/features/settings/presentation/pages/settings_page.dart';
import 'package:ai_financial_manager/features/wallets/presentation/pages/wallets_page.dart';
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
        AutoRoute(page: AIRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'records'),
            AutoRoute(path: 'records', page: RecordsRoute.page),
            AutoRoute(path: 'wallets', page: WalletsRoute.page),
            AutoRoute(path: 'plans', page: PlansRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
      ];
}
