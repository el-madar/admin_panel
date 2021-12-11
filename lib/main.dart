import 'package:admin_panel/app/AppNotifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: ChangeNotifierProvider<AppNotifier>(
        create: (context) => AppNotifier(),
        child: const MyApp(),
    ),
    supportedLocales: const [
      Locale('en', 'US'),
    ],
    startLocale: const Locale('en', 'US'),
    path: 'assets/language',
  ),);
}


