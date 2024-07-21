import 'package:flutter/material.dart';
import 'package:ai_financial_manager/app.dart';
import 'package:ai_financial_manager/main_config.dart';

void main() async {
  await prepareAppConfigAsync();

  runApp(
    const MainApp(env: 'production'),
  );
}
