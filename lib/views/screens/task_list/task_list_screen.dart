import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ringrin_1440task/views/constants/constant_color.dart';
import 'package:ringrin_1440task/views/screens/task_list/organisms/limit_part.dart';
import 'package:ringrin_1440task/views/screens/task_list/organisms/task_list_part.dart';

import 'common/show_modal_dialog.dart';
import 'organisms/modal/add_task_dialog_content.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: ConstantColor.bg,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showModalDialog(
              context: context,
              dialogWidget:  AddTaskDialogContent(),
              isScrollable: true);
        },
        backgroundColor: ConstantColor.baseColor,
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 24.0,
          color: ConstantColor.whiteColor,
        ),
      ),
      body: SizedBox(
        height: height * 0.3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height / 10,
              ),
              //1440分のタイマー
              const LimitPart(),
              const SizedBox(
                height: 8.0,
              ),
              //タスク一覧
              const TaskListPart()
            ],
          ),
        ),
      ),
    );
  }
}
