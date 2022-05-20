import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:monilet/constants.dart';
import 'package:monilet/system/system_state.dart';
import 'package:monilet/ui/palette.dart';

class LoadRadar extends StatelessWidget {
  const LoadRadar({
    Key? key,
    required this.loadAverage,
  }) : super(key: key);

  final LoadAverage loadAverage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: AspectRatio(
        aspectRatio: 1,
        child: RadarChart(
          RadarChartData(
            dataSets: [
              RadarDataSet(
                fillColor: Palette.green.withOpacity(.1),
                borderColor: Palette.green,
                entryRadius: 2,
                dataEntries: [
                  RadarEntry(value: loadAverage.oneMinute),
                  RadarEntry(value: loadAverage.fiveMinutes),
                  RadarEntry(value: loadAverage.fifteenMinutes),
                ],
              )
            ],
            radarBackgroundColor: Colors.transparent,
            borderData: FlBorderData(show: false),
            radarBorderData: const BorderSide(color: Colors.transparent),
            titlePositionPercentageOffset: 0.2,
            titleTextStyle: Constants.valueStyle,
            getTitle: (index) {
              switch (index) {
                case 0:
                  return "1 min";
                case 2:
                  return "15 min";
                case 1:
                  return "5 min";
                default:
                  return '';
              }
            },
            tickCount: 1,
            ticksTextStyle:
                const TextStyle(color: Colors.transparent, fontSize: 10),
            tickBorderData: const BorderSide(color: Colors.transparent),
            gridBorderData: const BorderSide(color: Palette.blue, width: 1),
          ),
        ),
      ),
    );
  }
}
