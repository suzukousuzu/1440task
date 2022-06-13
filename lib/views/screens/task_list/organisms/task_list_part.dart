import 'package:flutter/material.dart';

import '../modules/task_list_tab_bar.dart';

class TaskListPart extends StatelessWidget {
  const TaskListPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaskListTabBar(
      onChanged: (date) {},
    );
  }
}
