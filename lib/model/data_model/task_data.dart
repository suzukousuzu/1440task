import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_data.freezed.dart';
part 'task_data.g.dart';

@freezed
class TaskData with _$TaskData {
  const factory TaskData({
    required String taskId,
    required String taskName,
    required String taskDate,
    required bool isDone,
  }) = _TaskData;

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
}
