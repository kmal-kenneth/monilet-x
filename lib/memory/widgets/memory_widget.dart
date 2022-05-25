import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monilet/constants.dart';
import 'package:monilet/memory/provider/memory_provider.dart';
import 'package:monilet/memory/state/memory_state.dart';
import 'package:monilet/memory/utils.dart';
import 'package:monilet/ui/palette.dart';
import 'package:monilet/ui/widgets/base_indicator_widget.dart';
import 'package:monilet/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MemoryWidget extends ConsumerWidget {
  const MemoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MemoryState memoryState = ref.watch(memoryProvider);

    return BaseIndicatorWidget(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Memory:",
                style: Constants.labelStyle,
              ),
              const SizedBox(width: 8),
              Text(
                buildMemoryLabel(memoryState.total),
                style: Constants.valueStyle,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Indicator(
                    color: Palette.green,
                    title: 'Used',
                    subTitle:
                        '${buildMemoryLabel(memoryState.used)} ${percentage(memoryState.used, memoryState.total).toStringAsFixed(0)}%',
                    isSquare: false,
                    size: 16,
                  ),
                  const SizedBox(height: 4),
                  _Indicator(
                    color: Palette.blue,
                    title: 'Availeble ',
                    subTitle:
                        '${buildMemoryLabel(memoryState.availeble)} ${percentage(memoryState.availeble, memoryState.total).toStringAsFixed(0)}%',
                    isSquare: false,
                    size: 16,
                  ),
                  const SizedBox(height: 4),
                  _Indicator(
                    color: Palette.grey[1000] ?? Colors.transparent,
                    title: 'Free ',
                    subTitle:
                        '${buildMemoryLabel(memoryState.free)} ${percentage(memoryState.free, memoryState.total).toStringAsFixed(0)}%',
                    isSquare: false,
                    size: 16,
                  ),
                ],
              ),
              const Expanded(
                child: ChartMemory(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final Color color;
  final String title;
  final String? subTitle;
  final bool isSquare;
  final double size;

  const _Indicator({
    Key? key,
    required this.color,
    required this.title,
    this.subTitle,
    required this.isSquare,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Constants.labelStyle,
            ),
            if (subTitle != null)
              Text(
                subTitle ?? "",
                style: Constants.valueStyle,
              ),
          ],
        )
      ],
    );
  }
}

class ChartMemory extends ConsumerStatefulWidget {
  const ChartMemory({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ChartMemory> createState() => _ChartMemoryState();
}

class _ChartMemoryState extends ConsumerState<ChartMemory> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      activationMode: ActivationMode.singleTap,
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        decimalPlaces: 1,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MemoryState memoryState = ref.watch(memoryProvider);

    return AspectRatio(
        aspectRatio: 1.9,
        child: SfCartesianChart(
            trackballBehavior: _trackballBehavior,
            plotAreaBorderWidth: 1,
            plotAreaBorderColor: Palette.grey[800],
            primaryXAxis: DateTimeAxis(
                isVisible: false,
                interval: 15,
                majorGridLines: const MajorGridLines(width: 0),
                maximum: memoryState.timeOfLastRefresh,
                minimum: memoryState.timeOfLastRefresh
                    .subtract(const Duration(minutes: 1)),
                autoScrollingMode: AutoScrollingMode.start),
            primaryYAxis: NumericAxis(
                isVisible: false,
                labelFormat: '{value}%',
                opposedPosition: true,
                maximum: 100,
                minimum: 0,
                majorGridLines: const MajorGridLines(width: 0)),
            series: <ChartSeries>[
              LineSeries<MemoryRecord, DateTime>(
                  dataSource: memoryState.records,
                  name: 'Used',
                  color: Palette.green,
                  xValueMapper: (MemoryRecord data, _) => data.x,
                  yValueMapper: (MemoryRecord data, _) =>
                      percentage(data.y1, memoryState.total)),
              LineSeries<MemoryRecord, DateTime>(
                  dataSource: memoryState.records,
                  name: 'Available',
                  color: Palette.blue,
                  xValueMapper: (MemoryRecord data, _) => data.x,
                  yValueMapper: (MemoryRecord data, _) =>
                      percentage(data.y2, memoryState.total)),
              LineSeries<MemoryRecord, DateTime>(
                  dataSource: memoryState.records,
                  name: 'Free',
                  color: Palette.grey[1000],
                  xValueMapper: (MemoryRecord data, _) => data.x,
                  yValueMapper: (MemoryRecord data, _) =>
                      percentage(data.y3, memoryState.total)),
            ]));
  }
}
