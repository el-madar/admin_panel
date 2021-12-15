import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingItem extends StatelessWidget {
  SettingItem({Key? key,required this.title,required this.iconData,required this.onClick}) : super(key: key);

  String title;
  IconData iconData;
  VoidCallback onClick;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(iconData,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(title, style: Theme.of(context).textTheme.headline6,),
                  ),
                ),
                Container(
                  child: Icon(MdiIcons.chevronRight,
                      size: 24,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.3,
          ),
        ],
      ),
      onTap: onClick,
    );
  }
}
