import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/drawer/drawer_menu_web.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/drawer/my_bottom_navigation_bar.dart';
import 'package:admin_panel/ui/main/action_widget.dart';
import 'package:admin_panel/ui/main/chang_lang.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mini_profile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final DrawerViewModel drawerViewModel = DrawerViewModel();
  final EndDrawerViewModel endDrawerViewModel = EndDrawerViewModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: drawerViewModel,
        ),
        ChangeNotifierProvider.value(
          value: endDrawerViewModel,
        ),
      ],
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isScreenPhone = ScreenMedia.isMinimumSize(
            ScreenMediaType.XS,
            currentWidth: constraints.maxWidth,
          );
          return Scaffold(
            key: _scaffoldKey,
            appBar: isScreenPhone
                ? AppBar(
                    title: Selector<DrawerViewModel, DrawerModel>(
                      selector: (context, provider) => provider.selected,
                      builder: (context, selected, child) {
                        return Text(tr(drawerViewModel.selected.title));
                      },
                    ),
                    actions: const [
                      ActionWidget(),
                    ],
                  )
                : null,
            body: Stack(
              children: [
                Row(
                  children: [
                    isScreenPhone
                        ? const SizedBox()
                        : const DrawerMenuWebMaster(),
                    Expanded(
                      child: Selector<DrawerViewModel, DrawerModel>(
                        selector: (context, provider) => provider.selected,
                        builder: (context, selected, child) {
                          return drawerViewModel.selected.screen;
                        },
                      ),
                    ),
                  ],
                ),
                isScreenPhone
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          ActionWidget(),
                        ],
                      ),
              ],
            ),
            bottomNavigationBar: isScreenPhone
                ? const MyBottomNavigationBar()
                : const SizedBox(),
            endDrawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: MyCard(
                  child: Selector<EndDrawerViewModel, Widget>(
                    selector: (context, model) => model.endDrawerView,
                    builder: (context, view, child) {
                      return view;
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
