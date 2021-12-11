import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageScreen(title: tr('no_items'));
  }
}
