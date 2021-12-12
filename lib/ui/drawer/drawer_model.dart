
import 'package:flutter/cupertino.dart';

class DrawerModel {
  String title;
  IconData icon;
  late IconData iconSelected;
  Widget screen;
  int index;

  DrawerModel({
    required this.title,
    required this.icon,
    required this.screen,
    required this.index,
    IconData? iconSelected,
  }) {
    this.iconSelected = iconSelected ?? icon;
  }


}
