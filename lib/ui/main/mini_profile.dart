import 'package:admin_panel/ui/widgets/button_with_icon.dart';
import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:admin_panel/ui/widgets/setting_item.dart';
import 'package:admin_panel/utils/colors.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';

class MiniProfile extends StatelessWidget {
  const MiniProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(soSmallSize),
      child: Column(
        children:  [
          SizedBox(
            height: soBigSize,
            width: soBigSize,
            child: CircleAvatar(
                backgroundImage: NetworkImage(avatar)
            ),
          ),
          Text(
            "Ahmed khaled",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "Admin",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: smallSize,),
          SettingItem(title: "profile",iconData: Icons.account_circle_outlined, onClick: () {},),
          SettingItem(title: "Setting",iconData: Icons.settings, onClick: () {},),
          ButtonWithIcon(title: tr("logout"),color: accentColor,onClock: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },iconData: Icons.logout,isLoading: false,),
        ],
      ),
    );
  }
}
