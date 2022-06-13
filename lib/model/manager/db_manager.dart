import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/model/data_model/task_data.dart';

final dbManagerProvider = Provider<DbManager>((ref) => DbManager());

class DbManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTask(String userId, TaskData taskData) async {
    await _db
        .collection("users")
        .doc(userId)
        .collection("tasks")
        .doc(taskData.taskId)
        .set(taskData.toJson());
  }

  Future<List<TaskData>> fetchTasks(String userId) async {
    // final _now = DateTime.now();
    // //データの有無確認
    // final query =
    //     await _db.collection("users").doc(userId).collection("tasks").get();
    // if (query.docs.isEmpty) return [];
    //
    // var result = <TaskData>[];
    //  await _db.collection("users").doc(userId).collection("tasks");
    return [];


  }
}
