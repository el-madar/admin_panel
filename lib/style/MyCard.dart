// ignore_for_file: file_names

import 'dart:ui';

import 'package:admin_panel/app/AppNotifier.dart';
import 'package:admin_panel/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight
}

class MyShadow {
  late int alpha;
  late double elevation, spreadRadius, blurRadius;
  late Offset offset;
  late ShadowPosition position;
  Color? color;
  late bool darkShadow;

  MyShadow({
    double elevation = 8,
    double? spreadRadius,
    double? blurRadius,
    Offset? offset,
    ShadowPosition position = ShadowPosition.bottom,
    int? alpha,
    Color? color,
    bool darkShadow = false,
  }) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha ?? (darkShadow ? 100 : 36);
    this.elevation = elevation;
    this.position = position;
    this.color = color;
    this.darkShadow = darkShadow;

    if (offset == null) {
      switch (position) {
        case ShadowPosition.topLeft:
          this.offset = Offset(-elevation, -elevation);
          break;
        case ShadowPosition.top:
          this.offset = Offset(0, -elevation);
          break;
        case ShadowPosition.topRight:
          this.offset = Offset(elevation, -elevation);
          break;
        //TODO: Shadow problem
        case ShadowPosition.centerLeft:
          this.offset = Offset(-elevation, elevation * 0.25);
          break;
        case ShadowPosition.center:
          this.offset = Offset(0, 0);
          break;
        //TODO: Shadow problem
        case ShadowPosition.centerRight:
          this.offset = Offset(elevation, elevation * 0.25);
          break;
        case ShadowPosition.bottomLeft:
          this.offset = Offset(-elevation, elevation);
          break;
        case ShadowPosition.bottom:
          this.offset = Offset(0, elevation);
          break;
        case ShadowPosition.bottomRight:
          this.offset = Offset(elevation, elevation);
          break;
      }
    } else {
      this.offset = offset;
    }
  }
}

class MyCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final GestureTapCallback? onTap;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape? boxShape;
  final MyShadow? shadow;

  const MyCard(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.color,
      this.paddingAll,
      this.onTap,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.boxShape,
      this.shadow})
      : super(key: key);

  const MyCard.bordered(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.color,
      this.paddingAll,
      this.onTap,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.boxShape,
      this.shadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyShadow myShadow = shadow ?? MyShadow();

    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? builderChild) {
        return InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: color ?? Theme.of(context).cardColor,
                borderRadius: boxShape != BoxShape.circle
                    ? borderRadius ??
                        BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
                    : null,
                border: bordered
                    ? border ??
                        Border.all(color: Theme.of(context).backgroundColor, width: 1)
                    : null,
                shape: boxShape ?? BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: myShadow.color ??
                        Theme.of(context).shadowColor.withAlpha(myShadow.alpha),
                    spreadRadius: myShadow.spreadRadius,
                    blurRadius: myShadow.blurRadius,
                    offset: myShadow.offset,
                  )
                ]),
            padding: padding ?? Spacing.all(paddingAll ?? 16),
            clipBehavior: clipBehavior ?? Clip.none,
            child: child,
          ),
        );
      },
    );
  }
}
