import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BaseIndicatorWidget extends StatelessWidget {
  final Widget? child;
  final double sigma;
  final BorderRadius borderRadius;
  final Gradient gradient;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final bool scale;

  const BaseIndicatorWidget(
      {Key? key,
      required this.child,
      this.sigma = .3,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.gradient = const LinearGradient(colors: [
        Color.fromRGBO(36, 40, 47, .3),
        Color.fromRGBO(36, 40, 47, .1)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      this.borderColor = const Color(0xFF282C34),
      this.padding = const EdgeInsets.all(8),
      this.scale = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
        minWidth: 350,
        defaultScale: scale,
        defaultScaleFactor: 1,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: borderRadius,
                  border: Border.all(
                    width: 1.5,
                    color: borderColor,
                  ),
                ),
                child: child),
          ),
        ));
  }
}
