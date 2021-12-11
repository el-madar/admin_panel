import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/ui/drawer/drawer_menu.dart';
import 'package:admin_panel/ui/drawer/drawer_menu_web.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final DrawerViewModel viewModel = DrawerViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Selector<DrawerViewModel?, int>(
            selector: (context, provider) => provider!.index,
            builder: (context, index, child) {
              return Text(tr(viewModel.titles[index]));
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: const DrawerMenuMaster(),
        body: Row(
          children: [
            const DrawerMenuWebMaster(),
            const VerticalDivider(
              width: 1.3,
              thickness: 1.3,
              color: Colors.purple,
            ),
            Expanded(
              child: Selector<DrawerViewModel?, int>(
                selector: (context, provider) => provider!.index,
                builder: (context, index, child) {
                  return viewModel.screen[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
