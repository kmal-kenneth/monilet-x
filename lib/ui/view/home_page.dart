// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monilet/cpu/cpu.dart';
import 'package:monilet/cpu/widgets/gauge_cpu.dart';
import 'package:monilet/system/widgets/system_widget.dart';
import 'package:monilet/ui/palette.dart';
// import 'package:monilet/cpu/widgets/gauge_cpu.dart';
import 'package:monilet/ui/state/home_state.dart';
import 'package:monilet/ui/widgets/base_indicator_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';
import '../widgets/window_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.background,
        body: WindowBorder(
          color: Palette.grey[1000] ?? Colors.transparent,
          child: const RightSide(),
        ));
  }
}

class RightSide extends ConsumerWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState homestate = ref.watch(homeProvider);

    return Column(
      children: [
        BaseIndicatorWidget(
          borderRadius: BorderRadius.zero,
          padding: EdgeInsets.zero,
          scale: false,
          child: WindowTitleBarBox(
              child: Row(children: [
            Expanded(child: MoveWindow()),
            const WindowButtons()
          ])),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              SystemWidget(
                  name: homestate.system.name,
                  kernelVersion: homestate.system.kernelVersion,
                  longOsVresion: homestate.system.longOsVresion,
                  osVersion: homestate.system.osVersion,
                  hostname: homestate.system.hostname,
                  uptime: homestate.system.uptime,
                  boottime: homestate.system.boottime,
                  loadAverage: homestate.system.loadAverage),
              GaugeCpu(
                used: homestate.cpu.used,
                frequency: homestate.cpu.frequency,
                cores: homestate.cpu.coresCount,
              ),
              ChartCpu(cpu: homestate.cpu),
            ]),
          ),
        ),
      ],
    );
  }
}

class ChartCpu extends StatefulWidget {
  final Cpu cpu;

  const ChartCpu({Key? key, required this.cpu}) : super(key: key);

  @override
  State<ChartCpu> createState() => _CpuState();
}

class _CpuState extends State<ChartCpu> {
  late TrackballBehavior _trackballBehavior;
  late Cpu _cpu;

  @override
  void initState() {
    _cpu = widget.cpu;

    _trackballBehavior = TrackballBehavior(
      activationMode: ActivationMode.singleTap,
      enable: true,
      tooltipSettings: const InteractiveTooltip(enable: true),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 60,
        child: SfCartesianChart(
            trackballBehavior: _trackballBehavior,
            plotAreaBorderWidth: 1,
            plotAreaBorderColor: Palette.grey[800],
            primaryXAxis: DateTimeAxis(
                isVisible: false,
                interval: 15,
                majorGridLines: const MajorGridLines(width: 0),
                maximum: _cpu.timeOfLastRefresh,
                minimum:
                    _cpu.timeOfLastRefresh.subtract(const Duration(minutes: 1)),
                autoScrollingMode: AutoScrollingMode.start),
            primaryYAxis: NumericAxis(
                isVisible: false,
                labelFormat: '{value}%',
                opposedPosition: true,
                maximum: 100,
                minimum: 0,
                majorGridLines: const MajorGridLines(width: 0)),
            series: <ColumnSeries>[
              ColumnSeries<CpuRecord, DateTime>(
                gradient: Palette.linearBaseGradient,
                dataSource: _cpu.records,
                xValueMapper: (CpuRecord data, _) => data.x,
                yValueMapper: (CpuRecord data, _) => data.y,
              ),
            ]));
  }
}
