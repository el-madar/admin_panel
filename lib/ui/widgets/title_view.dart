import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  TitleView({Key? key,required this.title}) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6?.copyWith(
              // backgroundColor: Colors.orange
            )
        ),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
