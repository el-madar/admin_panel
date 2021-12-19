// ignore_for_file: file_names

import 'package:admin_panel/app/AppTheme.dart';
import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/utils/SizeConfig.dart';
import 'package:admin_panel/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/constants.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenMedia.isMinimumSize(
        ScreenMediaType.XS,
        currentWidth: MediaQuery.of(context).size.width,
      ) ? MediaQuery.of(context).size.width - 90  : 250,
      child: MyCard(
        paddingAll: 0,
        child: TextFormField(
          style: AppTheme.getTextStyle(
              GoogleFonts.ibmPlexSans(
                  textStyle: TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
              letterSpacing: 0,
              fontWeight: 500),
          decoration: InputDecoration(
              hintText: "Search",
              hintStyle: AppTheme.getTextStyle(
                  GoogleFonts.ibmPlexSans(
                      textStyle: TextStyle(fontSize: 15, color: const Color(0xff4a4c4f))),
                  letterSpacing: 0,
                  fontWeight: 500),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide.none),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide.none),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color(0xfff8faff),
              hoverColor: const Color(0xfff8faff),
              prefixIcon: Icon(
                MdiIcons.magnify,
                size: 20,
                color: Theme.of(context).primaryColor
                    .withAlpha(200),
              ),
              contentPadding: Spacing.fromLTRB(30, 14, 30, 14)),
          textCapitalization: TextCapitalization.sentences,
        ),
      ),
    );
  }
}
