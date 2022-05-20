import 'package:flutter/material.dart';
import 'package:monilet/constants.dart';
import 'package:monilet/system/system_state.dart';
import 'package:monilet/system/widgets/load_radar.dart';
import 'package:monilet/ui/palette.dart';
import 'package:monilet/ui/widgets/base_indicator_widget.dart';

class SystemWidget extends StatelessWidget {
  final String name;
  final String kernelVersion;
  final String longOsVresion;
  final String osVersion;
  final String hostname;
  final int uptime;
  final int boottime;
  final LoadAverage loadAverage;

  const SystemWidget(
      {Key? key,
      this.name = "",
      this.kernelVersion = "",
      this.longOsVresion = "",
      this.osVersion = "",
      this.hostname = "",
      this.uptime = 0,
      this.boottime = 0,
      this.loadAverage = const LoadAverage()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseIndicatorWidget(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$name $osVersion", style: Constants.labelStyle),
                  Row(
                    children: [
                      Text("Kernel:", style: Constants.labelStyle),
                      const SizedBox(width: 8),
                      Text(kernelVersion, style: Constants.valueStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Hostname:", style: Constants.labelStyle),
                      const SizedBox(width: 8),
                      Text(
                        hostname,
                        style: Constants.valueStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Uptime:", style: Constants.labelStyle),
                      const SizedBox(width: 8),
                      Text(Duration(seconds: uptime).toString(),
                          style: Constants.valueStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Boottime:", style: Constants.labelStyle),
                      const SizedBox(width: 8),
                      Text(
                          DateTime.fromMillisecondsSinceEpoch(boottime * 1000)
                              .toString(),
                          style: Constants.valueStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              LoadRadar(loadAverage: loadAverage),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Palette.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text("Load average", style: Constants.labelRadarStyle),
              const SizedBox(width: 6),
              Row(
                children: [
                  Text("1 min: ", style: Constants.labelStyle),
                  Text(loadAverage.oneMinute.toString(),
                      style: Constants.valueRadarStyle),
                  const SizedBox(width: 6),
                  Text("5 min: ", style: Constants.labelStyle),
                  Text(loadAverage.fiveMinutes.toString(),
                      style: Constants.valueRadarStyle),
                  const SizedBox(width: 6),
                  Text("15 min: ", style: Constants.labelStyle),
                  Text(loadAverage.fifteenMinutes.toString(),
                      style: Constants.valueRadarStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
