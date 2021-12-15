import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/drawer/drawer_menu_web.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/drawer/my_bottom_navigation_bar.dart';
import 'package:admin_panel/ui/main/chang_lang.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
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
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            SizedBox(
              height: defaultSize,
              width: defaultSize,
              child: DayNightSwitcherIcon(
                isDarkModeEnabled: true,
                onStateChanged: (isDarkModeEnabled) {

                },
              ),
            ),
            const SizedBox(width: soSmallSize,),

            Builder(
              builder: (context) => GestureDetector(
                child: const SizedBox(
                  height: defaultSize,
                  width: defaultSize,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(languageEnglish)
                  ),
                ),
                onTap: () {
                  endDrawerViewModel.setEndDrawerView(const ChangLang(), context);
                },
              ),
            ),
            const SizedBox(width: soSmallSize,),
            Builder(
              builder: (context) => GestureDetector(
                child: const SizedBox(
                  height: bigSize,
                  width: bigSize,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(avatar)
                  ),
                ),
                onTap: () {
                  endDrawerViewModel.setEndDrawerView(const MiniProfile(), context);
                },
              ),
            ),
            const SizedBox(width: soSmallSize,),
          ],
        ),
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
                      return drawerViewModel.selected.screen;
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
        endDrawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: MyCard(
              child: Selector<EndDrawerViewModel , Widget>(
                  selector: (context , model) => model.endDrawerView,
                  builder: (context , view, child){
                    return view;
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
