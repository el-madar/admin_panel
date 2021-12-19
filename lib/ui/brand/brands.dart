import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';
import '../../model/brand.dart';
import '../../mvvvm/brand_view_model.dart';
import '../../mvvvm/end_drawer_view_modle.dart';
import '../../style/ScreenMedia.dart';
import '../../utils/constants.dart';
import '../../utils/dialogs.dart';
import '../users/add_user.dart';
import '../widgets/button_with_icon.dart';
import '../widgets/list_loading_view.dart';
import '../widgets/searchView.dart';
import 'add_brand.dart';
import 'brand_card.dart';

class Brands extends StatelessWidget {
  Brands({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final BrandViewModel _brandController = BrandViewModel();

    final EndDrawerViewModel endDrawerViewModel =
    context.watch<EndDrawerViewModel?>()!;

    return ChangeNotifierProvider(
        create: (context) => _brandController,
        child: Consumer<BrandViewModel>(
          builder: (context, model, child) {
            if (model.errorMessage != '') {
              showErrorToast(model.errorMessage);
              if (model.errorMessage == tr('Unauthenticated')) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }
            }

            return Scaffold(
              body: Column(
                children: [
                  Container(
                      width: double.infinity,
                      margin: ScreenMedia.isMinimumSize(
                        ScreenMediaType.XS,
                        currentWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                      ) ? const EdgeInsets.only(top: soSmallSize,
                          left: soSmallSize,
                          right: soSmallSize) : const EdgeInsets.only(
                          top: soBigPadding,
                          left: soSmallSize,
                          right: soSmallSize),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SearchView(),
                          !ScreenMedia.isMinimumSize(
                            ScreenMediaType.XS,
                            currentWidth: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ) ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ButtonWithIcon(
                                  title: tr("filters"),
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  onClock: () {},
                                  iconData: Icons.filter_alt,
                                  isLoading: false,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ButtonWithIcon(
                                  title: tr("addBrand"),
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  onClock: () {
                                    endDrawerViewModel.setEndDrawerView(
                                        AddBrand(), context);
                                  },
                                  iconData: Icons.add_business_sharp,
                                  isLoading: false,),
                              ),
                            ],
                          ) : Container(
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
                  model.isLoading ? const ListLoadingView() : Expanded(
                    child: ResponsiveGridList(
                      horizontalGridMargin: defaultPadding,
                      verticalGridMargin: defaultPadding,
                      minItemWidth: 400,
                      children: List.generate(
                        model.brandsList.length, (index) =>
                          BrandCard(brand: model.brandsList[index],),
                      ),
                    ),
                  )
                ],
              ),
              floatingActionButton: ScreenMedia.isMinimumSize(
                ScreenMediaType.XS,
                currentWidth: MediaQuery
                    .of(context)
                    .size
                    .width,
              ) ? FloatingActionButton(
                  child: const Icon(Icons.add_business_sharp),
                  onPressed: () {
                    endDrawerViewModel.setEndDrawerView(AddBrand(), context);
                  }
              ) : const SizedBox(),
            );
          },
        ));
  }

}