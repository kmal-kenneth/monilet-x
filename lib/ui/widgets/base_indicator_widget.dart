import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monilet/ui/palette.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BaseIndicatorWidget extends StatelessWidget {
  final Widget? child;

  const BaseIndicatorWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double start = .3;
    const double end = .1;
    const double radius = 8;
    const double sigma = .3;
    final Color color = Palette.grey[1000] ?? Colors.transparent;
    final Color borderColor = Palette.grey[900] ?? Colors.transparent;
    return ResponsiveWrapper(
        minWidth: 350,
        defaultScale: true,
        defaultScaleFactor: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(start),
                      color.withOpacity(end),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    width: 1.5,
                    color: borderColor.withOpacity(.6),
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.black38,
                  //     blurRadius: 8,
                  //     offset: Offset(0, 4),
                  //   ),
                  // ],
                ),
                child: child),
          ),
        ));
  }
}
