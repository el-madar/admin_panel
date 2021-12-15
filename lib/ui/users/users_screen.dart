import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: MessageScreen(title: tr('Users Screen')),
      onTap: () {
        Provider.of<EndDrawerViewModel>(context, listen: false).setEndDrawerView(const Center(child: Text("Users Screen")), context);
      },
    );
  }
}
