// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskData _$$_TaskDataFromJson(Map<String, dynamic> json) => _$_TaskData(
      taskId: json['taskId'] as String,
      taskName: json['taskName'] as String,
      taskDate: json['taskDate'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$$_TaskDataToJson(_$_TaskData instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'taskName': instance.taskName,
      'taskDate': instance.taskDate,
      'isDone': instance.isDone,
    };
