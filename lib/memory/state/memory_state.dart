import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory_state.freezed.dart';

@freezed
class MemoryState with _$MemoryState {
  const factory MemoryState({
    @Default(0) int total,
    @Default(0) int used,
    @Default(0) int free,
    @Default(0) int availeble,
    required DateTime timeOfLastRefresh,
    @Default([]) List<MemoryRecord> records,
  }) = _MemoryState;
}

class MemoryRecord {
  MemoryRecord(
    this.x,
    this.y1,
    this.y2,
    this.y3,
  );
  final DateTime x;
  final int y1;
  final int y2;
  final int y3;
}
