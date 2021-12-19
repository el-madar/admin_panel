import 'package:admin_panel/ui/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../utils/constants.dart';
import 'loadingView.dart';

class ListLoadingView extends StatelessWidget {
  const ListLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ResponsiveGridList(
        horizontalGridMargin: defaultPadding,
        verticalGridMargin: defaultPadding,
        minItemWidth: 400,
        children: List.generate(
          50, (index) => const LoadingView(),
        ),
      ),
    );
  }
}
