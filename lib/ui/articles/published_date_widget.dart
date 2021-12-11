import 'package:admin_panel/ui/help_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PublishedDateWidget extends StatelessWidget {
  const PublishedDateWidget({
    Key? key,
    required this.publishedAt,
    this.viewType = 1,
  }) : super(key: key);

  final DateTime publishedAt;
  final int viewType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(marginMin),
          child: Text(
            DateFormat.yMMMd().format(publishedAt),
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: viewType == 1 ? Colors.grey : Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}
