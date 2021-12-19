import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/loadingView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const LoadingView(),
      onTap: () {
        Provider.of<EndDrawerViewModel>(context, listen: false).setEndDrawerView(const Center(child: Text("Home Screen")), context);
      },
    );
  }
}
