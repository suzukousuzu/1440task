import 'package:flutter/src/material/time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/model/data_model/task_data.dart';
import 'package:ringrin_1440task/model/manager/db_manager.dart';
import 'package:ringrin_1440task/views/constants/constant_time_format.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../shered_preference/shered_preference.dart';

final taskListRepositoryProvider =
Provider<TaskListRepository>((ref) => TaskListRepository(ref.read));

class TaskListRepository {
  final Reader _read;
  TaskListRepository(this._read);

  late final dbManager = _read(dbManagerProvider);
  late final sheredPreference = _read(sheredPreferenceProvider);

  Future<void> setBedTime(TimeOfDay selectedTime) async{
    await sheredPreference.setBedTime(selectedTime);
  }

  Future<TimeOfDay>  fetchBedTime() async{
    return await sheredPreference.fetchBedTime();

  }

  Future<void>saveTask(String userId, String taskName) async{
    final uuId = const Uuid().v1();
    final _now = DateTime.now();
    final _nowString = DateTimeFormat.standardDate(_now);
    //TODO:createdAtのところをもう少し、考えなければいけない。就寝時間によって定義が違う
    final taskData = TaskData(taskId: uuId, taskName: taskName,taskDate: _nowString ,isDone: false);
    await dbManager.saveTask(userId,taskData);
  }

  Future<List<TaskData>>fetchTasks(String userId) async{
    return await dbManager.fetchTasks(userId);
  }
}