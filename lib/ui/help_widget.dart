import 'package:admin_panel/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

////////////////////////////////////////////////////////////////
var cardRounded =  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(22),
);
var cardRoundedZero = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
);
var cardRoundedTop =  const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);
var cardRoundedBottom = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(20.0),
    bottomRight: Radius.circular(20.0),
  ),
);
////////////////////////////////////////////////////////////////
final textFiledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(marginMin),
  borderSide: const BorderSide(),
);
var radiusButton =  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(paddingBig),
);
///////////////////////////////////////////////////////////////////////
var shipRounded = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12),
);
/////////////////////////////////////////////////////////////////////
const double marginMin = 8;
const double paddingBig = 16;
const double elevation = 6;
const double elevationSmall = 4;
////////////////////////////////////////////////////////////////////
Widget loadingWidget = SpinKitFadingCircle(
  color: primaryColor,
  size: 50.0,
);


