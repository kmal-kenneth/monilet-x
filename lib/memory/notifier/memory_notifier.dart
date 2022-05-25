import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monilet/ffi.dart';

import '../state/memory_state.dart';

class MemoryNotifier extends StateNotifier<MemoryState> {
  MemoryNotifier() : super(MemoryState(timeOfLastRefresh: DateTime.now())) {
    init();
    loop();
  }

  init() async {
    int total = await api.totalMemory();

    state = state.copyWith(total: total);
  }

  loop() {
    Timer.periodic(const Duration(seconds: 1), (_) async {
      int used = await api.usedMemory();
      int free = await api.freeMemory();
      int availeble = await api.availableMemory();

      state = state.copyWith(
        used: used,
        free: free,
        availeble: availeble,
        records: [
          ...state.records,
          MemoryRecord(
            DateTime.now(),
            used,
            availeble,
            free,
          ),
        ],
        timeOfLastRefresh: DateTime.now(),
      );

      removeUnnecessaryRecords();
    });
  }

  removeUnnecessaryRecords() {
    if (state.records.length > 60) {
      state = state.copyWith(
        records: state.records.sublist(1),
      );
    }
  }
}
