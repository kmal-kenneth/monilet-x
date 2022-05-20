import 'package:flutter/material.dart';
import 'package:monilet/ui/widgets/base_indicator_widget.dart';

class MemoryWidget extends StatelessWidget {
  const MemoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseIndicatorWidget(
      child: Text("hola"),
    );
  }
}
