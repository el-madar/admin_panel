import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: const MyApp(),
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      startLocale: const Locale('en', 'US'),
      path: 'assets/language',
    ),
  );
}


