import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/memory_notifier.dart';
import '../state/memory_state.dart';

final memoryProvider =
    StateNotifierProvider<MemoryNotifier, MemoryState>((ref) {
  return MemoryNotifier();
});
