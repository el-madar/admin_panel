import 'package:flutter/material.dart';

import '../help_widget.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    Key? key,
    required this.title,
    this.errors = false,
  }) : super(key: key);

  final String title;
  final bool errors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(paddingBig),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: errors ? Theme.of(context).errorColor : Colors.black,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
