import 'package:ai_financial_manager/core/UI/router/router.dart';
import 'package:ai_financial_manager/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage();
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabsRouter? tabsRouter;
  final fab = [
    FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    FloatingActionButton(onPressed: () {}, child: const Icon(Icons.wallet)),
    FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    const SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      duration: 200.duration,
      homeIndex: 1,
      routes: const [
        RecordsRoute(),
        WalletsRoute(),
        PlansRoute(),
        SettingsRoute(),
      ],
      builder: (ctx, child, pageCon) {
        tabsRouter ??= AutoTabsRouter.of(ctx);
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          // appBar: const CustomAppBar(
          //     // leadingWidget: ,
          //     ),
          body: child,
          floatingActionButton: const SizedBox(),
          bottomNavigationBar: CustomBottomNavBar(tabsRouter: tabsRouter),
        ).expanded();
      },
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter? tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: tabsRouter?.activeIndex ?? 0,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => tabsRouter?.setActiveIndex(index),
      items: [
        _getItem(icon: 'Assets', title: 'records', activeColor: Colors.red),
        _getItem(icon: 'assets', title: 'wallets', activeColor: Colors.purpleAccent),
        _getItem(icon: 'assets', title: 'plans', activeColor: Colors.pink),
        _getItem(icon: 'settings', title: 'settings', activeColor: Colors.blue),
      ],
    ).clipRRect(topLeft: 10, topRight: 10);
  }

  _getItem({
    required String icon,
    required Color activeColor,
    required String title,
  }) {
    return BottomNavyBarItem(
      icon: SvgPicture.asset(icon),
      title: Text(title),
      activeColor: activeColor,
    );
  }
}
