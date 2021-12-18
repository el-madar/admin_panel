import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/button_with_icon.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children:  [
                const SizedBox(
                  height: soBigSize,
                  width: soBigSize,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(avatar)
                  ),
                ),
                const SizedBox(width: soSmallSize,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmed khaled",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "Admin",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWithIcon(title: tr("profile"),color: Theme.of(context).accentColor,onClock: () {},iconData: Icons.person,isLoading: false,),
            ),
          ],
        )
    );
  }
}
