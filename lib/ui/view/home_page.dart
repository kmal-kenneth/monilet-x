import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:monilet/cpu/widgets/gauge_cpu.dart';
import 'package:monilet/ui/palette.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/home_viewmodel.dart';
import '../widgets/window_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, _) => Scaffold(
            body: WindowBorder(
                color: Palette.background,
                width: 1,
                child: const RightSide())));
  }
}

class RightSide extends ViewModelWidget<HomeViewModel> {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      color: Palette.background,
      child: ListView(children: [
        WindowTitleBarBox(
            child: Row(children: [
          Expanded(child: MoveWindow()),
          const WindowButtons()
        ])),
        GaugeCpu(
          used: viewModel.used,
          frequency: viewModel.frequency,
        ),
      ]),
    );
  }
}
