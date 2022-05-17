// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:monilet/chartfl.dart';
import 'package:monilet/system/widgets/system_widget.dart';
import 'package:monilet/ui/palette.dart';
// import 'package:monilet/cpu/widgets/gauge_cpu.dart';
import 'package:monilet/ui/state/home_state.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import '../widgets/window_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:
            // WindowBorder(
            //     color: Palette.background,
            //     width: 1,
            //     child: const RightSide())
            RightSide());
  }
}

class RightSide extends ConsumerWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeState homestate = ref.watch(homeProvider);

    return Container(
      color: Palette.grey[900],
      padding: const EdgeInsets.all(8),
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

        // WindowTitleBarBox(
        //     child: Row(children: [
        //   Expanded(child: MoveWindow()),
        //   const WindowButtons()
        // ])),
        Center(
          child: Text(
            homestate.cpu.name,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // GaugeCpu(
        //   used: homestate.cpu.used,
        //   frequency: homestate.cpu.frequency,
        //   cores: homestate.cpu.coresCount,
        // ),
        Text(
          homestate.cpu.used.toString(),
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
        // ChartCpu(cpu: homestate.cpu),
        const BarChartSample3(),
        AnimatedRadialGauge(
          /// The animation duration.
          duration: const Duration(milliseconds: 500),

          /// Gauge value.
          value: homestate.cpu.used,

          /// Provide the [min] and [max] value for the [value] argument.
          min: 0,
          max: 100,

          /// Optionally, you can configure your gauge, providing additional
          /// styles and transformers.
          axis: GaugeAxis(
            /// Render the gauge as a 260-degree arc.
            degrees: 260,

            /// Display the green value progress.
            transformer: const GaugeAxisTransformer.progress(color: Colors.red),

            /// Set the background color and axis thickness.
            style: const GaugeAxisStyle(
              thickness: 20,
              background: Color(0xFFD9DEEB),
            ),

            /// Define the pointer that will indicate the progress.
            pointer: RoundedTrianglePointer(
              size: 20,
              backgroundColor: Colors.black,
              borderRadius: 2,
              border: const GaugePointerBorder(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),

          /// You can also, define the value label style.
          style: const GaugeStyle(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 46,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]),
    );
  }
}

// class ChartCpu extends StatefulWidget {
//   final Cpu cpu;

//   const ChartCpu({Key? key, required this.cpu}) : super(key: key);

//   @override
//   State<ChartCpu> createState() => _CpuState();
// }

// class _CpuState extends State<ChartCpu> {
//   late TrackballBehavior _trackballBehavior;
//   late Cpu _cpu;

//   @override
//   void initState() {
//     _cpu = widget.cpu;

//     _trackballBehavior = TrackballBehavior(
//       activationMode: ActivationMode.singleTap,
//       enable: true,
//       tooltipSettings: const InteractiveTooltip(enable: true),
//     );

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: 300,
//         height: 60,
//         child: SfCartesianChart(
//             trackballBehavior: _trackballBehavior,
//             plotAreaBorderWidth: 1,
//             plotAreaBorderColor: Palette.grey[800],
//             primaryXAxis: DateTimeAxis(
//                 isVisible: false,
//                 interval: 15,
//                 majorGridLines: const MajorGridLines(width: 0),
//                 maximum: _cpu.timeOfLastRefresh,
//                 minimum:
//                     _cpu.timeOfLastRefresh.subtract(const Duration(minutes: 1)),
//                 autoScrollingMode: AutoScrollingMode.start),
//             primaryYAxis: NumericAxis(
//                 isVisible: false,
//                 labelFormat: '{value}%',
//                 opposedPosition: true,
//                 maximum: 100,
//                 minimum: 0,
//                 majorGridLines: const MajorGridLines(width: 0)),
//             series: <ColumnSeries>[
//               ColumnSeries<CpuRecord, DateTime>(
//                 gradient: Palette.linearBaseGradient,
//                 dataSource: _cpu.records,
//                 xValueMapper: (CpuRecord data, _) => data.x,
//                 yValueMapper: (CpuRecord data, _) => data.y,
//               ),
//             ]));
//   }
// }
