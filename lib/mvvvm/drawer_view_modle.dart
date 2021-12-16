import 'package:admin_panel/ui/brand/brand_screen.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/home_screen/home_screen.dart';
import 'package:admin_panel/ui/users/users_screen.dart';
import 'package:flutter/material.dart';

class DrawerViewModel with ChangeNotifier {
  late ValueNotifier<bool> isExtended = ValueNotifier(false);

  final List<DrawerModel> screens = [
    DrawerModel(
      screen: const HomeScreen(),
      icon: Icons.home,
      title: 'home',
      index: 0,
    ),
    DrawerModel(
      screen: UsersScreen(),
      icon: Icons.person,
      title: 'users',
      index: 1,
    ),
    DrawerModel(
      screen: const BrandScreen(),
      icon: Icons.store,
      title: 'brand',
      index: 2,
    ),
  ];

  late DrawerModel _selected = screens.first;

  DrawerViewModel() {
    _selected = screens.first;
  }

  DrawerModel get selected => _selected;

  void editScreen(int index) {
    _selected = screens[index];
    notifyListeners();
  }
}
