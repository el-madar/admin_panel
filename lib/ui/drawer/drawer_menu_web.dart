import 'dart:math';

import 'package:admin_panel/app/AppTheme.dart';
import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/utils/SizeConfig.dart';
import 'package:admin_panel/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMenuWebMaster extends StatelessWidget {
  const DrawerMenuWebMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<DrawerViewModel>(
          // selector: (context, provider) => provider!.index,
          builder: (context, provider, child) {
            return ValueListenableBuilder<bool>(
                valueListenable: provider.isExtended,
                builder: (context, value, child) {
                  return NavigationRail(
                    backgroundColor: Colors.grey,
                    elevation: 10,
                    extended: provider.isExtended.value,
                    leading: _NavigationRailHeader(
                      extended: provider.isExtended,
                      // brandTextColor: brandTextColor,
                    ),
                    selectedIndex: provider.selected.index,
                    onDestinationSelected: (int index) {
                      provider.editScreen(index);
                    },
                    minExtendedWidth: 200,
                    labelType: NavigationRailLabelType.none,
                    /*------------- Build Tabs -------------------*/
                    destinations: provider.screens
                        .map(
                          (item) => NavigationRailDestination(
                        icon: Icon(
                          item.icon,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 18,
                        ),
                        padding: Spacing.zero,
                        selectedIcon: Icon(
                          item.iconSelected,
                          color: Theme.of(context).colorScheme.primary,
                          size: 18,
                        ),
                        label: Text(
                          item.title,
                          style: AppTheme.getTextStyle(
                            Theme.of(context).textTheme.caption!,
                            color: provider.selected.index == item.index
                                ? (Theme.of(context).colorScheme.primary)
                                : (Theme.of(context).colorScheme.onBackground),
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  );
                });
          },
        ),
        const VerticalDivider(
          width: 1.3,
          thickness: 1.3,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class _NavigationRailHeader extends StatelessWidget {
  final ValueNotifier<bool> extended;
  final Color? brandTextColor;

  const _NavigationRailHeader({
    required this.extended,
    this.brandTextColor,
  }) : assert(extended != null);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          widthFactor: animation.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    InkWell(
                      key: const ValueKey('ReplyLogo'),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: animation.value * pi,
                            child: const Icon(
                              Icons.arrow_left,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          Spacing.width(2),
                          const Image(
                            image: AssetImage(
                              imagePlaceholder,
                            ),
                            width: 24,
                          ),
                          Spacing.width(12),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            widthFactor: animation.value,
                            child: Opacity(
                              opacity: animation.value,
                              child: Text(
                                'FLUTKIT',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1!,
                                    fontWeight: 700,
                                    color: brandTextColor ??
                                        themeData.colorScheme.onBackground,
                                    letterSpacing: 0.4),
                              ),
                            ),
                          ),
                          SizedBox(width: 18 * animation.value),
                        ],
                      ),
                      splashColor: Colors.white24,
                      highlightColor: Colors.white24,
                      onTap: () {
                        extended.value = !extended.value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
