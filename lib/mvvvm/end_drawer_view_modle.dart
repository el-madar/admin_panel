import 'package:admin_panel/ui/brand/brand_screen.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/home_screen/home_screen.dart';
import 'package:admin_panel/ui/users/users_screen.dart';
import 'package:flutter/material.dart';

class EndDrawerViewModel with ChangeNotifier {

  Widget _endDrawerView = const SizedBox();


  Widget get endDrawerView => _endDrawerView;

  void setEndDrawerView(Widget endDrawerView,BuildContext context) {
    _endDrawerView = endDrawerView;
    notifyListeners();
    Scaffold.of(context).openEndDrawer();
  }
}
