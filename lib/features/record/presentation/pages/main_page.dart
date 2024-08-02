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
    FABBuilderWidget(
      iconString: Assets.assetsIconsRecords,
      onTap: () {},
    ),
    FABBuilderWidget(
      iconString: Assets.assetsIconsWallets,
      onTap: () {},
    ),
    FABBuilderWidget(
      iconString: Assets.assetsIconsPlans,
      onTap: () {},
    ),
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
        );
      },
    );
  }
}

class FABBuilderWidget extends StatelessWidget {
  const FABBuilderWidget({
    super.key,
    required this.iconString,
    required this.onTap,
  });
  final String iconString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: SvgPicture.asset(
        iconString,
      ),
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
      itemPadding: EdgeInsets.zero,
      itemCornerRadius: 25,
      items: [
        _getItem(icon: Assets.assetsIconsRecords, title: 'records', activeColor: AppColors.primary),
        _getItem(icon: Assets.assetsIconsWallets, title: 'wallets', activeColor: AppColors.primary),
        _getItem(icon: Assets.assetsIconsPlans, title: 'plans', activeColor: AppColors.primary),
        _getItem(icon: Assets.assetsIconsSettings, title: 'settings', activeColor: AppColors.primary),
      ],
    ).clipRRect(all: 20).padding(horizontal: 30, vertical: 20);
  }

  _getItem({
    required String icon,
    required Color activeColor,
    required String title,
  }) {
    return BottomNavyBarItem(
      icon: SvgPicture.asset(icon, width: 28.w).padding(left: 2),
      title: Text(
        title,
        style: infoStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ).center(),
      activeColor: activeColor,
    );
  }
}
