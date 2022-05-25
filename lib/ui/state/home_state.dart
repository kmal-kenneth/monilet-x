import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monilet/cpu/cpu.dart';
import 'package:monilet/system/system_state.dart';

import '../../ffi.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState()) {
    init();
    loop();
  }

  init() async {
    //system
    state.system.name = await api.systemName();
    state.system.kernelVersion = await api.kernelVersion();
    state.system.osVersion = await api.osVersion();
    state.system.longOsVresion = await api.longOsVersion();
    state.system.hostname = await api.hostname();
    state.system.boottime = await api.bootTime();

    // cpu
    state.cpu.name = await api.cpuBrand();
    state.cpu.coresCount = await api.cpuCoreCount();
    update();
  }

  loop() {
    Timer.periodic(const Duration(seconds: 1), (_) async {
      // system
      state.system.uptime = await api.uptime();

      var load = await api.loadAverage();
      state.system.loadAverage = LoadAverage(
          oneMinute: load.one,
          fiveMinutes: load.five,
          fifteenMinutes: load.fifteen);

      // cpu
      state.cpu.used = await api.cpuUsed();

      state.cpu.addRecord(CpuRecord(DateTime.now(), state.cpu.used));

      state.cpu.timeOfLastRefresh = DateTime.now();

      state.cpu.frequency = await api.cpuFrequency();

      update();
    });
  }

  update() {
    state = HomeState.state(state);
  }
}

class HomeState {
  SystemState system = SystemState();
  Cpu cpu = Cpu();

  HomeState();
  HomeState.state(HomeState state) {
    cpu = state.cpu;
    system = state.system;
  }
}
