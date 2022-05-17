import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monilet/cpu/cpu.dart' as my_cpu;
import 'package:monilet/ffi.dart';

class HomeViewModel extends ChangeNotifier {
  final my_cpu.Cpu cpu = my_cpu.Cpu();

  Future<void> initialise() async {
    cpu.name = await api.cpuBrand();
    cpu.coresCount = await api.cpuCoreCount();

    Timer.periodic(const Duration(seconds: 1), (_) async {
      cpu.used = await api.cpuUsed();

      cpu.addRecord(my_cpu.CpuRecord(DateTime.now(), cpu.used));

      cpu.timeOfLastRefresh = DateTime.now();

      cpu.frequency = await api.cpuFrequency();
      notifyListeners();
    });
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
