import 'dart:async';
import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Repository.preferences = prefs;
      bool isOpen = prefs.getBool('firstOpen') ?? false;
      if (!isOpen) {
        await prefs.setBool('firstOpen', true);
        // await Repository().getURLFromFirebase();
        yield FirstOpenApp();
      } else {
        yield* _mapAppStartedToState();
      }
    } else if (event is LoggedIn) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState((state as Authenticated).userInfo.token!);
    } else if (event is UnauthenticatedEvent) {
      yield Unauthenticated();
    } else if (event is SendTokenFirebase && state is Authenticated) {
      // await Repository().sendToken(event.token);
      // yield state;
    } else if (event is GetVersionApp && state is Authenticated) {
      // var responseData = await Repository().versionApp();
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // int buildNumber = int.parse(packageInfo.buildNumber); // 1
      // if (Platform.isAndroid) {
      //   // Android-specific code
      //   int versionUpdate = int.parse(responseData["current_android_version"]);
      //   if (responseData["current_android_version_update_force"] == '1' &&
      //       versionUpdate > buildNumber) {
      //     yield MostUpdateApp();
      //   }
      // } else if (Platform.isIOS) {
      //   int versionUpdate = int.parse(responseData["current_ios_version"]);
      //   // iOS-specific code
      //   if (responseData["current_ios_version_update_force"] == '1' &&
      //       versionUpdate > buildNumber) {
      //     yield MostUpdateApp();
      //   }
      // }
    } else if (event is UpdateLanguage && state is Authenticated) {
      // await Repository().updateLanguage(
      //   event.language,
      // );
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final User? user = await Repository().getLoginUser();
      // await Repository().getURLFromFirebase();
      if (user != null) {
        yield Authenticated(userInfo: user);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState(String token) async* {
    // var firBaseToken = await FirebaseMessaging.instance.getToken();
    try {
      await Repository().logoutOfLine();
      await Repository().logout();
      yield Unauthenticated();
    } catch (e) {
      yield Unauthenticated();
    }
//    repository.deleteFireBaseToken(user.id);
  }
}
