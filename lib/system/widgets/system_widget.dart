import 'package:flutter/material.dart';
import 'package:monilet/constants.dart';
import 'package:monilet/system/system_state.dart';
import 'package:monilet/ui/palette.dart';

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
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Palette.grey[1000],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Palette.grey[800] ?? Colors.transparent, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("One", style: Constants.labelStyle),
                  Text(loadAverage.oneMinute.toString(),
                      style: Constants.valueStyle),
                ],
              ),
              Column(
                children: [
                  Text("Five", style: Constants.labelStyle),
                  Text(loadAverage.fiveMinutes.toString(),
                      style: Constants.valueStyle),
                ],
              ),
              Column(
                children: [
                  Text("Fifteen", style: Constants.labelStyle),
                  Text(loadAverage.fifteenMinutes.toString(),
                      style: Constants.valueStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
