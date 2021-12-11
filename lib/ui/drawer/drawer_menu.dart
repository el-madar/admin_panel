import 'package:admin_panel/mvvvm/drawer_view_modle.dart';
import 'package:admin_panel/ui/help_widget.dart';
import 'package:admin_panel/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMenuMaster extends StatelessWidget {
  const DrawerMenuMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.watch<DrawerViewModel>()
    final DrawerViewModel? viewModel = context.watch<DrawerViewModel?>();
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(paddingBig),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    iconProfile,
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(width: paddingBig),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Text(
                        tr('welcome'),
                        style:
                            Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        'Tony Roshdy',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: paddingBig),
            Expanded(
              child: ListView(
                children: [
                  ////////////////////////////////////////////////////////////
                  ListTile(
                    title: Text(tr('articles')),
                    leading: Image.asset(
                      iconOnlineNews,
                      width: 30,
                      height: 30,
                    ),
                    onTap: () => editScreenAndBAck(context, viewModel, 0),
                    selected: viewModel!.index == 0,
                  ),
                  ListTile(
                    leading: Image.asset(
                      iconLive,
                      width: 30,
                      height: 30,
                    ),
                    title: Text(tr('live_chat')),
                    onTap: () => editScreenAndBAck(context, viewModel, 1),
                    selected: viewModel.index == 1,
                  ),
                  ListTile(
                    leading: Image.asset(
                      iconGallery,
                      width: 30,
                      height: 30,
                    ),
                    title: Text(tr('gallery')),
                    onTap: () => editScreenAndBAck(context, viewModel, 2),
                    selected: viewModel.index == 2,
                  ),
                  ListTile(
                    leading: Icon(
                      viewModel.index == 3
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    title: Text(tr('wish_list')),
                    onTap: () => editScreenAndBAck(context, viewModel, 3),
                    selected: viewModel.index == 3,
                  ),
                  ListTile(
                    leading: Image.asset(
                      iconExplore,
                      width: 30,
                      height: 30,
                    ),
                    title: Text(tr('explore_online_news')),
                    onTap: () => editScreenAndBAck(context, viewModel, 4),
                    selected: viewModel.index == 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  editScreenAndBAck(
      BuildContext context, DrawerViewModel? viewModel, int index) {
    viewModel!.editScreen(index);
    Navigator.of(context).pop();
  }
}
