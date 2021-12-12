import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DrawerViewModel, DrawerModel>(
      selector: (context, provider) => provider.selected,
      builder: (context, selected, child) {
        final DrawerViewModel provider =
        context.watch<DrawerViewModel?>()!;
        return BottomNavigationBar(
          currentIndex: selected.index,
          onTap: (index) {
            provider.editScreen(index);
          },
          items: provider.screens
              .map(
                (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: tr(item.title),
            ),
          )
              .toList(),
        );
      },
    );
  }
}
