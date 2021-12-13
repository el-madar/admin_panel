
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AwesomeDialog showErrorDialog(BuildContext context,String description){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.SCALE,
    title: tr('error'),
    desc: description,
    btnCancelOnPress: () {

    },
  );
}

void showErrorToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      webShowClose: true,
      fontSize: 16.0,
      webBgColor: "#FF5A5F"
  );
}

AwesomeDialog showLoadingDialog(BuildContext context){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.BOTTOMSLIDE,
    title: tr("loading"),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularProgressIndicator(),
        Text(tr("loading"))
      ],
    ),
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
  );
}

AwesomeDialog showSuccesDialog(BuildContext context,String description){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    title: 'SUCCES',
    desc: description,
    btnOkOnPress: () {},
  );
}