import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/ui/auth/login_screen.dart';
import 'package:admin_panel/ui/main/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'AppTheme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var easyLocal = EasyLocalization.of(context);
    return Consumer<AppNotifier>(
        builder: (BuildContext context,AppNotifier  value, Widget?  child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: tr("app_title"),
            onGenerateTitle: (context) => tr("app_title"),
            localizationsDelegates: [
              easyLocal!.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: easyLocal.supportedLocales,
            locale: easyLocal.locale,
            themeMode: value.themeMode(),
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: LoginScreen(),
          );
        },
    );
  }
}
