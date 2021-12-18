import 'package:admin_panel/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonWithIcon extends StatelessWidget {
  ButtonWithIcon({Key? key,required this.color,required this.title,required this.onClock,this.iconData,required this.isLoading}) : super(key: key);

  Color color;
  String title;
  VoidCallback onClock;
  IconData? iconData;
  bool isLoading;

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
      child: isLoading ? SpinKitThreeInOut(color: Theme.of(context).accentColor,size: 20,):Row(
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
