import 'package:admin_panel/style/MyCard.dart';
import 'package:admin_panel/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: SizedBox(
        width: 250,
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(soSmallSize),
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(color: Colors.white,),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(soSmallSize),
                  child: SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(color: Colors.white,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(soSmallSize),
                  child: SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(color: Colors.white,),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
