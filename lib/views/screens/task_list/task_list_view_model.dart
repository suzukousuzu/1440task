import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/screens/base_view_model.dart';

import '../../../model/data_model/task_data.dart';
import '../../../model/repository/task_list_repository.dart';
import '../../main_view_model.dart';

///autoDisposeをつけることによって勝手に破棄してくれる
// final AutoDisposeChangeNotifierProviderFamily<TaskListViewModel, String>
// bikeDetailModelProvider = ChangeNotifierProvider.family
//     .autoDispose((ref, String userId) => TaskListViewModel(ref.read, userId));
///基本的にこれを使う
final taskListViewModelProvider =
ChangeNotifierProvider((ref) {
  // Reader を渡しています（不要なら省略可能）
  return TaskListViewModel(ref.read);
});


class TaskListViewModel extends BaseViewModel {

  TaskListViewModel(this._read);

  // Reader 型をフィールドに持っておくことで、他のProviderを読み取ることができるようになる
  final Reader _read;

  late final taskListRepository = _read(taskListRepositoryProvider);

  //就寝時間
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);
  //就寝する日付
  DateTime bedDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 0);


  ///プライオリティ
  //プライオリティ番号
  int selectedPriorityIndex = 0;

  ///タスクリスト
  List<TaskData> tasks = [];

  @override
  Future<void> init() async {
    //就寝時間の取得
    await _fetchBedTime();

    //タスクリストの取得
    await _fetchTasks();
    notifyListeners();
  }

  Future<void> _fetchBedTime() async{
    selectedTime =  await taskListRepository.fetchBedTime();
  }

  Future<void> _fetchTasks() async{
    ///userIdを呼び出すために仕方なく、mainViewModelを呼んでいる(本当は一方通行にしないといけない)
    final userId = MainViewModel.userId;
    tasks =  await taskListRepository.fetchTasks(userId);
  }

  //就寝時間の設定
  void pickedTime(hour, minute) {
    final _now = DateTime.now();
    selectedTime = TimeOfDay(hour: hour, minute: minute);
    bedDateTime = DateTime(_now.year, _now.month, _now.day, selectedTime.hour, selectedTime.minute);

    bedDateTime = DateTime(
        _now.year,
        _now.month,
        selectedTime.hour < _now.hour ? _now.day + 1 : _now.day,
        selectedTime.hour,
        selectedTime.minute);

    if (bedDateTime.isBefore(_now)) {
      bedDateTime = DateTime(_now.year, _now.month, _now.day + 1,
          selectedTime.hour, selectedTime.minute);
    }
    notifyListeners();
  }

  Future<void> setBedTime() async{
    await taskListRepository.setBedTime(selectedTime);
  }

  Future<void> saveTask(String userId, String taskName) async{
    await taskListRepository.saveTask(userId, taskName);
  }



}