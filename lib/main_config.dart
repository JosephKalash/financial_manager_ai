import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/services/db.dart';
import 'core/utils/internet_info.dart';
import 'injectable/injecter.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}

Future<void> prepareAppConfigAsync() async {
  final wb = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: wb);

  InternetInfo.initState;
  await Future.wait([
    configureDependencies(),
    EasyLocalization.ensureInitialized(),
    DB.initDB(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]),
  ]);
}
