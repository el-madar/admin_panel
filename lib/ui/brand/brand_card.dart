import 'package:admin_panel/model/brand.dart';
import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BrandCard extends StatelessWidget {
  BrandCard({Key? key,required this.brand,required this.onClick}) : super(key: key);

  Brand brand;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MyCard(
        onTap: onClick,
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
                        brand.name!,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        brand.type!,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
