
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/widgets/button_with_icon.dart';
import 'package:admin_panel/ui/widgets/searchView.dart';
import 'package:admin_panel/ui/widgets/user_card.dart';
import 'package:admin_panel/utils/colors.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: ScreenMedia.isMinimumSize(
              ScreenMediaType.XS,
              currentWidth: MediaQuery.of(context).size.width,
            ) ? const EdgeInsets.only(top: soSmallSize,left: soSmallSize,right: soSmallSize) : const EdgeInsets.only(top: soBigPadding,left: soSmallSize,right: soSmallSize),
            child: Flex(
              direction: !ScreenMedia.isMinimumSize(
                ScreenMediaType.XS,
                currentWidth: MediaQuery.of(context).size.width,
              ) ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SearchView(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonWithIcon(title: tr("filters"),color: Theme.of(context).primaryColor,onClock: () {},iconData: Icons.filter_alt,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonWithIcon(title: tr("addUser"),color: Theme.of(context).primaryColor,onClock: () {},iconData: Icons.person_add_alt,),
                    ),
                  ],
                )
              ],
            )
          ),
          Expanded(
            child: ResponsiveGridList(
              horizontalGridMargin: defaultPadding,
              verticalGridMargin: defaultPadding,
              minItemWidth: 400,
              children: List.generate(100, (index) => const UserCard(),),
            ),
          )
        ],
      )
    );
  }
}
