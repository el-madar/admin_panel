import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnlineNewsScreen extends StatelessWidget {
  const OnlineNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageScreen(title: tr('service_not_available'));
  }
}
