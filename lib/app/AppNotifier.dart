// ignore_for_file: file_names

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  static bool kIsWeb = kIsWeb;
  static bool kIsWindow = Platform.isWindows;
  static bool kIsLinux = Platform.isLinux;
  static bool kIsMac = Platform.isMacOS;

  static bool kIsFullScreen = kIsLinux || kIsWeb || kIsWindow || kIsMac;

  AppNotifier() {
    init();
  }

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? data = sharedPreferences.getInt("themeMode");
    if (data == null) {
      _themeMode = ThemeMode.light;
    } else if (data == 1) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }

    notifyListeners();
  }

  ThemeMode themeMode() => _themeMode;

  Future<void> updateTheme(int themeMode) async {
    _themeMode = themeMode == 1 ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("themeMode", themeMode);
  }
}
