// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return _TaskData.fromJson(json);
}

/// @nodoc
class _$TaskDataTearOff {
  const _$TaskDataTearOff();

  _TaskData call(
      {required String taskId,
      required String taskName,
      required String taskDate,
      required bool isDone}) {
    return _TaskData(
      taskId: taskId,
      taskName: taskName,
      taskDate: taskDate,
      isDone: isDone,
    );
  }

  TaskData fromJson(Map<String, Object?> json) {
    return TaskData.fromJson(json);
  }
}

/// @nodoc
const $TaskData = _$TaskDataTearOff();

/// @nodoc
mixin _$TaskData {
  String get taskId => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  String get taskDate => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDataCopyWith<TaskData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataCopyWith<$Res> {
  factory $TaskDataCopyWith(TaskData value, $Res Function(TaskData) then) =
      _$TaskDataCopyWithImpl<$Res>;
  $Res call({String taskId, String taskName, String taskDate, bool isDone});
}

/// @nodoc
class _$TaskDataCopyWithImpl<$Res> implements $TaskDataCopyWith<$Res> {
  _$TaskDataCopyWithImpl(this._value, this._then);

  final TaskData _value;
  // ignore: unused_field
  final $Res Function(TaskData) _then;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskName = freezed,
    Object? taskDate = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDate: taskDate == freezed
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TaskDataCopyWith<$Res> implements $TaskDataCopyWith<$Res> {
  factory _$TaskDataCopyWith(_TaskData value, $Res Function(_TaskData) then) =
      __$TaskDataCopyWithImpl<$Res>;
  @override
  $Res call({String taskId, String taskName, String taskDate, bool isDone});
}

/// @nodoc
class __$TaskDataCopyWithImpl<$Res> extends _$TaskDataCopyWithImpl<$Res>
    implements _$TaskDataCopyWith<$Res> {
  __$TaskDataCopyWithImpl(_TaskData _value, $Res Function(_TaskData) _then)
      : super(_value, (v) => _then(v as _TaskData));

  @override
  _TaskData get _value => super._value as _TaskData;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? taskName = freezed,
    Object? taskDate = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_TaskData(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      taskDate: taskDate == freezed
          ? _value.taskDate
          : taskDate // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskData with DiagnosticableTreeMixin implements _TaskData {
  const _$_TaskData(
      {required this.taskId,
      required this.taskName,
      required this.taskDate,
      required this.isDone});

  factory _$_TaskData.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDataFromJson(json);

  @override
  final String taskId;
  @override
  final String taskName;
  @override
  final String taskDate;
  @override
  final bool isDone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskData(taskId: $taskId, taskName: $taskName, taskDate: $taskDate, isDone: $isDone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskData'))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('taskName', taskName))
      ..add(DiagnosticsProperty('taskDate', taskDate))
      ..add(DiagnosticsProperty('isDone', isDone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskData &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.taskName, taskName) &&
            const DeepCollectionEquality().equals(other.taskDate, taskDate) &&
            const DeepCollectionEquality().equals(other.isDone, isDone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(taskName),
      const DeepCollectionEquality().hash(taskDate),
      const DeepCollectionEquality().hash(isDone));

  @JsonKey(ignore: true)
  @override
  _$TaskDataCopyWith<_TaskData> get copyWith =>
      __$TaskDataCopyWithImpl<_TaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDataToJson(this);
  }
}

abstract class _TaskData implements TaskData {
  const factory _TaskData(
      {required String taskId,
      required String taskName,
      required String taskDate,
      required bool isDone}) = _$_TaskData;

  factory _TaskData.fromJson(Map<String, dynamic> json) = _$_TaskData.fromJson;

  @override
  String get taskId;
  @override
  String get taskName;
  @override
  String get taskDate;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$TaskDataCopyWith<_TaskData> get copyWith =>
      throw _privateConstructorUsedError;
}
