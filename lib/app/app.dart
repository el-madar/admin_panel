import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/ui/main/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
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
    var fontApp = GoogleFonts.roboto();
    var fontThemeApp = GoogleFonts.robotoTextTheme();
    return Consumer<AppNotifier>(
        builder: (BuildContext context,AppNotifier  value, Widget?  child){
          // customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
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
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            // theme: ThemeData(
            //   primaryColor: primaryColor,
            //   // primaryColorLight: primaryColorLight,
            //   // primaryColorDark: primaryColorDark,
            //   scaffoldBackgroundColor: backgroundScreenColor,
            //   cardColor: cardColor,
            //   errorColor: errorColor,
            //   fontFamily: fontApp.fontFamily,
            //   appBarTheme: const AppBarTheme(
            //     color: primaryColor,
            //     elevation: 1,
            //     iconTheme: IconThemeData(color: Colors.white),
            //   ),
            //   ////////////////////////////////////////////////////////////////////
            //   cardTheme: CardTheme(
            //     shape: cardRoundedZero,
            //     color: cardColor,
            //     elevation: elevationSmall,
            //   ),
            //   //////////////////////////////////////////////////////////////////
            //   elevatedButtonTheme: ElevatedButtonThemeData(
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: paddingBig,
            //         horizontal: paddingBig,
            //       ),
            //       primary: accentColor,
            //       elevation: 2,
            //       shape: cardRoundedZero,
            //     ),
            //   ),
            //   //////////////////////////////////////////////////////////
            //   textTheme: fontThemeApp.copyWith(
            //     bodyText1: fontThemeApp.bodyText1!.copyWith(
            //       color: Colors.black,
            //       fontSize: 14
            //     ),
            //     subtitle1: fontThemeApp.subtitle1!.copyWith(
            //       color: Colors.grey,
            //       fontSize: 12
            //     ),
            //   ),
            //   /////////////////////////////////////////////////////////////////////
            // ),
            home: MainScreen(),
          );
        },
    );
  }
}
