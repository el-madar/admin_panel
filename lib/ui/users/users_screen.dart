
import 'package:admin_panel/mvvvm/end_drawer_view_modle.dart';
import 'package:admin_panel/style/ScreenMedia.dart';
import 'package:admin_panel/ui/widgets/button_with_icon.dart';
import 'package:admin_panel/ui/widgets/searchView.dart';
import 'package:admin_panel/ui/users/user_card.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import 'add_user.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final EndDrawerViewModel endDrawerViewModel =
    context.watch<EndDrawerViewModel?>()!;
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
              direction:  Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SearchView(),
                !ScreenMedia.isMinimumSize(
                  ScreenMediaType.XS,
                  currentWidth: MediaQuery.of(context).size.width,
                ) ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ButtonWithIcon(title: tr("filters"),color: Theme.of(context).primaryColor,onClock: () {},iconData: Icons.filter_alt,isLoading: false,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ButtonWithIcon(title: tr("addUser"),color: Theme.of(context).primaryColor,onClock: () {
                        endDrawerViewModel.setEndDrawerView(AddUser(), context);
                      },iconData: Icons.person_add_alt,isLoading: false,),
                    ),
                  ],
                ) :  Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(soSmallSize),
                  child: FloatingActionButton(
                    child: const Icon(Icons.filter_alt),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: ResponsiveGridList(
              horizontalGridMargin: defaultPadding,
              verticalGridMargin: defaultPadding,
              minItemWidth: 400,
              children: List.generate(100, (index) => UserCard(),),
            ),
          )
        ],
      ),
      floatingActionButton: ScreenMedia.isMinimumSize(
        ScreenMediaType.XS,
        currentWidth: MediaQuery.of(context).size.width,
      ) ? FloatingActionButton(
            child: const Icon(Icons.person_add),
            onPressed: () {
              endDrawerViewModel.setEndDrawerView(AddUser(), context);
            }
          ) : const SizedBox(),
    );
  }
}
