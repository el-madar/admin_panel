import 'package:admin_panel/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  ButtonWithIcon({Key? key,required this.color,required this.title,required this.onClock,this.iconData}) : super(key: key);

  Color color;
  String title;
  VoidCallback onClock;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return MaterialButton
      (
      elevation: 5.0,
      color: color,
      onPressed: onClock,
      padding: const EdgeInsets.all(defaultPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconData != null ? Icon(iconData) : Container(),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
