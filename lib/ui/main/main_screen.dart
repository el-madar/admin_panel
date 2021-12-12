import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/drawer/drawer_menu_web.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/drawer/my_bottom_navigation_bar.dart';
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
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isScreenPhone = ScreenMedia.isMinimumSize(
              ScreenMediaType.XS,
              currentWidth: constraints.maxWidth,
            );
            return Row(
              children: [
                isScreenPhone ? const SizedBox() : const DrawerMenuWebMaster(),
                Expanded(
                  child: Selector<DrawerViewModel, DrawerModel>(
                    selector: (context, provider) => provider.selected,
                    builder: (context, selected, child) {
                      return viewModel.selected.screen;
                    },
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (ScreenMedia.isMinimumSize(ScreenMediaType.XS,
                currentWidth: constraints.maxWidth)) {
              return const MyBottomNavigationBar();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
