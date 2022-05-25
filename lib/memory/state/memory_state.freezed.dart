// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemoryState {
  int get total => throw _privateConstructorUsedError;
  int get used => throw _privateConstructorUsedError;
  int get free => throw _privateConstructorUsedError;
  int get availeble => throw _privateConstructorUsedError;
  DateTime get timeOfLastRefresh => throw _privateConstructorUsedError;
  List<MemoryRecord> get records => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoryStateCopyWith<MemoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryStateCopyWith<$Res> {
  factory $MemoryStateCopyWith(
          MemoryState value, $Res Function(MemoryState) then) =
      _$MemoryStateCopyWithImpl<$Res>;
  $Res call(
      {int total,
      int used,
      int free,
      int availeble,
      DateTime timeOfLastRefresh,
      List<MemoryRecord> records});
}

/// @nodoc
class _$MemoryStateCopyWithImpl<$Res> implements $MemoryStateCopyWith<$Res> {
  _$MemoryStateCopyWithImpl(this._value, this._then);

  final MemoryState _value;
  // ignore: unused_field
  final $Res Function(MemoryState) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? used = freezed,
    Object? free = freezed,
    Object? availeble = freezed,
    Object? timeOfLastRefresh = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      free: free == freezed
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      availeble: availeble == freezed
          ? _value.availeble
          : availeble // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfLastRefresh: timeOfLastRefresh == freezed
          ? _value.timeOfLastRefresh
          : timeOfLastRefresh // ignore: cast_nullable_to_non_nullable
              as DateTime,
      records: records == freezed
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<MemoryRecord>,
    ));
  }
}

/// @nodoc
abstract class _$$_MemoryStateCopyWith<$Res>
    implements $MemoryStateCopyWith<$Res> {
  factory _$$_MemoryStateCopyWith(
          _$_MemoryState value, $Res Function(_$_MemoryState) then) =
      __$$_MemoryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int total,
      int used,
      int free,
      int availeble,
      DateTime timeOfLastRefresh,
      List<MemoryRecord> records});
}

/// @nodoc
class __$$_MemoryStateCopyWithImpl<$Res> extends _$MemoryStateCopyWithImpl<$Res>
    implements _$$_MemoryStateCopyWith<$Res> {
  __$$_MemoryStateCopyWithImpl(
      _$_MemoryState _value, $Res Function(_$_MemoryState) _then)
      : super(_value, (v) => _then(v as _$_MemoryState));

  @override
  _$_MemoryState get _value => super._value as _$_MemoryState;

  @override
  $Res call({
    Object? total = freezed,
    Object? used = freezed,
    Object? free = freezed,
    Object? availeble = freezed,
    Object? timeOfLastRefresh = freezed,
    Object? records = freezed,
  }) {
    return _then(_$_MemoryState(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: used == freezed
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      free: free == freezed
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      availeble: availeble == freezed
          ? _value.availeble
          : availeble // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfLastRefresh: timeOfLastRefresh == freezed
          ? _value.timeOfLastRefresh
          : timeOfLastRefresh // ignore: cast_nullable_to_non_nullable
              as DateTime,
      records: records == freezed
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<MemoryRecord>,
    ));
  }
}

/// @nodoc

class _$_MemoryState implements _MemoryState {
  const _$_MemoryState(
      {this.total = 0,
      this.used = 0,
      this.free = 0,
      this.availeble = 0,
      required this.timeOfLastRefresh,
      final List<MemoryRecord> records = const []})
      : _records = records;

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int used;
  @override
  @JsonKey()
  final int free;
  @override
  @JsonKey()
  final int availeble;
  @override
  final DateTime timeOfLastRefresh;
  final List<MemoryRecord> _records;
  @override
  @JsonKey()
  List<MemoryRecord> get records {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'MemoryState(total: $total, used: $used, free: $free, availeble: $availeble, timeOfLastRefresh: $timeOfLastRefresh, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemoryState &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.used, used) &&
            const DeepCollectionEquality().equals(other.free, free) &&
            const DeepCollectionEquality().equals(other.availeble, availeble) &&
            const DeepCollectionEquality()
                .equals(other.timeOfLastRefresh, timeOfLastRefresh) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(used),
      const DeepCollectionEquality().hash(free),
      const DeepCollectionEquality().hash(availeble),
      const DeepCollectionEquality().hash(timeOfLastRefresh),
      const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  _$$_MemoryStateCopyWith<_$_MemoryState> get copyWith =>
      __$$_MemoryStateCopyWithImpl<_$_MemoryState>(this, _$identity);
}

abstract class _MemoryState implements MemoryState {
  const factory _MemoryState(
      {final int total,
      final int used,
      final int free,
      final int availeble,
      required final DateTime timeOfLastRefresh,
      final List<MemoryRecord> records}) = _$_MemoryState;

  @override
  int get total => throw _privateConstructorUsedError;
  @override
  int get used => throw _privateConstructorUsedError;
  @override
  int get free => throw _privateConstructorUsedError;
  @override
  int get availeble => throw _privateConstructorUsedError;
  @override
  DateTime get timeOfLastRefresh => throw _privateConstructorUsedError;
  @override
  List<MemoryRecord> get records => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MemoryStateCopyWith<_$_MemoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
