// ignore_for_file: file_names

import 'dart:ui';

import 'package:admin_panel/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle textStyle,
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double finalFontSize = fontSize ?? textStyle.fontSize!;

    Color finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle.color!.withAlpha(160)
          : (muted ? textStyle.color!.withAlpha(200) : textStyle.color)!;
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.ibmPlexSans(
      fontSize: finalFontSize,
      fontWeight: _getFontWeight(fontWeight),
      letterSpacing: letterSpacing,
      color: finalColor,
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
    );
  }


  static const lightColorTextAppBar = Color(0xff495057);
  static const darkColorTextAppBar = Color(0xffffffff);
  //App Bar Text
  static final TextTheme lightAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 102,
        color: lightColorTextAppBar,
      ),
    ),
    headline2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 64,
        color: lightColorTextAppBar,
      ),
    ),
    headline3: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 51,
        color: lightColorTextAppBar,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    headline4: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 36,
        color: lightColorTextAppBar,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    headline5: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
          fontSize: 25,
          color: lightColorTextAppBar,
        overflow: TextOverflow.ellipsis,
      )
    ),
    headline6: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 18,
        color: lightColorTextAppBar,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    subtitle1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 17,
        color: lightColorTextAppBar,
      ),
    ),
    subtitle2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: lightColorTextAppBar,
      ),
    ),
    bodyText1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 16,
        color: lightColorTextAppBar,
      ),
    ),
    bodyText2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 14,
        color: lightColorTextAppBar,
      ),
    ),
    button: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: lightColorTextAppBar,
      ),
    ),
    caption: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 13,
        color: lightColorTextAppBar,
      ),
    ),
    overline: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 11,
        color: lightColorTextAppBar,
      ),
    ),
  );
  static final TextTheme darkAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 102,
        color: darkColorTextAppBar,
      ),
    ),
    headline2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 64,
        color: darkColorTextAppBar,
      ),
    ),
    headline3: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 51,
        color: darkColorTextAppBar,
      ),
    ),
    headline4: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 36,
        color: darkColorTextAppBar,
      ),
    ),
    headline5: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 25,
        color: darkColorTextAppBar,
      ),
    ),
    headline6: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 20,
        color: darkColorTextAppBar,
      ),
    ),
    subtitle1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 17,
        color: darkColorTextAppBar,
      ),
    ),
    subtitle2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: darkColorTextAppBar,
      ),
    ),
    bodyText1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 16,
        color: darkColorTextAppBar,
      ),
    ),
    bodyText2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 14,
        color: darkColorTextAppBar,
      ),
    ),
    button: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: darkColorTextAppBar,
      ),
    ),
    caption: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 13,
        color: darkColorTextAppBar,
      ),
    ),
    overline: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 11,
        color: darkColorTextAppBar,
      ),
    ),
  );


  static const lightColorText = Color(0xff4a4c4f);
  static const darkColorText = Colors.white;
  //Text Themes
  static final TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 102,
        color: lightColorText,
      ),
    ),
    headline2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 64,
        color: lightColorText,
      ),
    ),
    headline3: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 51,
        color: lightColorText,
      ),
    ),
    headline4: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 36,
        color: lightColorText,
      ),
    ),
    headline5: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 25,
        color: lightColorText,
      ),
    ),
    headline6: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 18,
        color: lightColorText,
      ),
    ),
    subtitle1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 17,
        color: lightColorText,
      ),
    ),
    subtitle2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: lightColorText,
      ),
    ),
    bodyText1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 16,
        color: lightColorText,
      ),
    ),
    bodyText2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 14,
        color: lightColorText,
      ),
    ),
    button: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 15,
        color: lightColorText,
      ),
    ),
    caption: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 13,
        color: lightColorText,
      ),
    ),
    overline: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(
        fontSize: 11,
        color: lightColorText,
      ),
    ),
  );
  static final TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 102, color: darkColorText),
    ),
    headline2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 64, color: darkColorText),
    ),
    headline3: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 51, color: darkColorText),
    ),
    headline4: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 36, color: darkColorText),
    ),
    headline5: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 25, color: darkColorText),
    ),
    headline6: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 18, color: darkColorText),
    ),
    subtitle1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 17, color: darkColorText),
    ),
    subtitle2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 15, color: darkColorText),
    ),
    bodyText1: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 16, color: darkColorText),
    ),
    bodyText2: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 14, color: darkColorText),
    ),
    button: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 15, color: darkColorText),
    ),
    caption: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 13, color: darkColorText),
    ),
    overline: GoogleFonts.ibmPlexSans(
      textStyle: const TextStyle(fontSize: 11, color: darkColorText),
    ),
  );


  //Color Themes

  static const primary = Color(0xFF00A699);
  static const secondary = Color(0xFF1DA1F2);

  static const backgroundColor = Color(0xFFEEEEEE);
  static const scaffoldBackgroundColor = Color(0xFFEEEEEE);
  static const backgroundDark = Color(0xff464c52);


  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    // canvasColor: Colors.transparent,
    accentColor: secondary,
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      // textTheme: lightAppBarTextTheme,
      actionsIconTheme: IconThemeData(
        color: lightColorTextAppBar,
      ),
      color: Color(0xffffffff),
      iconTheme: IconThemeData(color: lightColorTextAppBar, size: 24),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      selectedIconTheme: IconThemeData(
        color: primary,
        opacity: 1,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: lightColorTextAppBar,
        opacity: 1,
        size: 24,
      ),
      backgroundColor: Color(0xffffffff),
      elevation: 3,
      selectedLabelTextStyle: TextStyle(color: primary),
      unselectedLabelTextStyle: TextStyle(color: lightColorTextAppBar),
    ),
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.white,
      primaryVariant: primaryColor,
      secondary: lightColorTextAppBar,
      secondaryVariant: Color(0xff3cd278),
      onSecondary: Colors.white,
      surface: Color(0xffe2e7f1),
      background: Color(0xfff3f4f7),
      onBackground: lightColorTextAppBar,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: primary,
        hoverColor: primary,
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    cardColor: Colors.white,
    // accentColor: const primary,
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle: lightTextTheme.bodyText2!.merge(
        const TextStyle(color: lightColorTextAppBar),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xffffffff),
      elevation: 2,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: lightColorTextAppBar,
      labelColor: primary,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primary, width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primary,
      inactiveTrackColor: primary.withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: primary,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    primaryColor: primary,
    accentColor: secondary,
    scaffoldBackgroundColor: backgroundDark,
    backgroundColor: backgroundDark,
    appBarTheme: const AppBarTheme(
      // textTheme: darkAppBarTextTheme,
      actionsIconTheme: IconThemeData(
        color: Color(0xffffffff),
      ),
      color: Color(0xff2e343b),
      iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primary,
      primaryVariant: primary,
      secondary: Color(0xff00cc77),
      secondaryVariant: Color(0xff00cc77),
      background: Color(0xff343a40),
      onPrimary: Colors.white,
      onBackground: Colors.white,
      onSecondary: Colors.white,
      surface: Color(0xff585e63),
    ),
    cardTheme: const CardTheme(
      color: Color(0xff37404a),
      shadowColor: Color(0xff000000),
      elevation: 1,
      margin: EdgeInsets.all(0),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: darkTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
    ),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: Colors.orange,
    cardColor: const Color(0xff282a2b),
    splashColor: Colors.white.withAlpha(100),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        splashColor: Colors.white,
        highlightElevation: 8,
        elevation: 4,
        focusColor: primary,
        hoverColor: primary,
        foregroundColor: Colors.white),
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff37404a),
      textStyle: lightTextTheme.bodyText2!
          .merge(const TextStyle(color: Color(0xffffffff))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: lightColorTextAppBar,
      labelColor: primary,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primary, width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primary,
      inactiveTrackColor: primary,
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: primary,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red.shade100,
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(),
  );
}
