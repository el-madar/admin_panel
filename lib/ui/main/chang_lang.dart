import 'package:admin_panel/ui/widgets/title_view.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangLang extends StatelessWidget {
  const ChangLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TitleView(title: tr('changeLanguage'),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: 70,
              child: Image.asset(languageEnglish),
            ),
            Container(
              height: 70,
              width: 70,
              child: Image.asset(languageArabic),
            ),
          ],
        ),
        Image.asset(
          languages,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
