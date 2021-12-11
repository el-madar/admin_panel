
import 'package:admin_panel/style/Properties.dart';
import 'package:flutter/material.dart';

import 'ScreenMedia.dart';



class MyCol extends StatefulWidget {
  final Widget child;
  final Map<ScreenMediaType,int> flex;
  final Map<ScreenMediaType,DisplayType>? display;


  MyCol({Key? key, required this.child, required this.flex,  this.display,}) : super(key: key);

  @override
  _MyColState createState() => _MyColState();


}

class _MyColState extends State<MyCol> {


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
