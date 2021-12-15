import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/ui/main/chang_lang.dart';
import 'package:admin_panel/ui/main/mini_profile.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppNotifier appViewModel = context.watch<AppNotifier?>()!;
    final EndDrawerViewModel endDrawerViewModel =
        context.watch<EndDrawerViewModel?>()!;
    return Row(
      children: [
        DayNightSwitcherIcon(
          isDarkModeEnabled: appViewModel.themeMode() == ThemeMode.dark,
          onStateChanged: (isDarkModeEnabled) {
            appViewModel.updateTheme(isDarkModeEnabled ? 2 : 1);
          },
        ),
        const SizedBox(width: soSmallSize),
        Builder(
          builder: (context) => GestureDetector(
            child: const SizedBox(
              height: defaultSize,
              width: defaultSize,
              child: CircleAvatar(backgroundImage: AssetImage(languageEnglish)),
            ),
            onTap: () {
              endDrawerViewModel.setEndDrawerView(const ChangLang(), context);
            },
          ),
        ),
        const SizedBox(width: soSmallSize),
        Builder(
          builder: (context) => GestureDetector(
            child: const SizedBox(
              height: bigSize,
              width: bigSize,
              child: CircleAvatar(backgroundImage: NetworkImage(avatar)),
            ),
            onTap: () {
              endDrawerViewModel.setEndDrawerView(const MiniProfile(), context);
            },
          ),
        ),
        const SizedBox(width: soSmallSize),
      ],
    );
  }
}
