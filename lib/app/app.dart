import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/bloc/authentication/bloc.dart';
import 'package:admin_panel/ui/auth/login_screen.dart';
import 'package:admin_panel/ui/main/main_screen.dart';
import 'package:admin_panel/ui/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'AppTheme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthenticationBloc _authenticationBloc = AuthenticationBloc();


  @override
  Widget build(BuildContext context) {
    var easyLocal = EasyLocalization.of(context);
    return Consumer<AppNotifier>(
        builder: (BuildContext context,AppNotifier  value, Widget?  child){
          return BlocProvider(
            create: (context) => _authenticationBloc,
            child: MaterialApp(
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
              home: BlocBuilder(
                bloc: _authenticationBloc,
                builder: (context, state) {
                  if (state is Uninitialized) {
                    return SplashScreen();
                  }
                  if (state is Authenticated) {
                    return MainScreen();
                  }
                  if (state is Unauthenticated) {
                    return LoginScreen();
                  }
                  if (state is CompleteProfile) {
                    return LoginScreen();
                  }
                  if (state is FirstOpenApp) {
                    return LoginScreen();
                  }
                  if (state is MostUpdateApp) {
                    return LoginScreen();
                  }
                  return LoginScreen();
                },
              ),
            ),
          );
        },
    );
  }
}
