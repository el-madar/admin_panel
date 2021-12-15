import 'package:admin_panel/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangLang extends StatelessWidget {
  const ChangLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        languages,
        fit: BoxFit.cover,
      ),
    );
  }
}
