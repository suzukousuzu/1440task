import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/main_view_model.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_view_model.dart';

import '../../../../../model/data_model/task_data.dart';
import '../../../../constants/constant_color.dart';
import '../../../../constants/style.dart';
import '../../modules/priority_picker_part.dart';

class AddTaskDialogContent extends HookConsumerWidget {
  final bool isEdit;
  final TaskData? todoTask;
  final DateTime? date;

  AddTaskDialogContent({Key? key,
    this.isEdit = false,
    this.todoTask,
    this.date})
      : super(key: key);

  final titleTextEditingController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (isEdit && todoTask != null) {
    //   //編集時の初期表示
    //   titleTextEditingController.text = todoTask!.taskName;
    //   viewModel.selectedPriorityIndex = todoTask!.priority ?? 9;
    //   viewModel.selectedDay = todoTask!.taskDate;
    // }
    //
    // //カレンダーから遷移してきた時の初期表示
    // if (isCalenderTask) {
    //   viewModel.selectedDay = date ?? DateTime.now();
    // }
    final bottomSpace = MediaQuery
        .of(context)
        .viewInsets
        .bottom;
    return SizedBox(
      height: bottomSpace + 200,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28.0,
              ),
              //テキストフィールド
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _form,
                  child: TextFormField(
                      autofocus: true,
                      onSaved: (value) => null,
                      maxLines: 2,
                      controller: titleTextEditingController,
                      decoration: const InputDecoration(
                        hintText: "何をしますか",
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'タスク名を入力してください';
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //タスク実行日&優先度選択
                      GestureDetector(
                        onTap: () {
                          // return showModalDialog(
                          //     context: context,
                          //     dialogWidget: ChangeNotifierProvider.value(
                          //         value: viewModel, child: TimeRoutineDialog()),
                          //     isScrollable: true);
                        },
                        child: Container(
                          width: 96,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: ConstantColor.green02,
                            border: Border.all(color: ConstantColor.green02),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendarCheck,
                                color: ConstantColor.whiteColor,
                                size: 16.0,
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                //TODO:後で
                                "今日",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: ConstantColor.whiteColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      //プライオリティの選択
                      PriorityPickerPart(
                        isEdit: isEdit,
                      ),
                    ],
                  ),
                  GestureDetector(
                    //就寝時間を渡す
                      onTap: () => _saveTask(context, ref),
                      child: const Chip(
                          backgroundColor: Color(0xFF0F8987),
                          label: Center(
                            child: Text(
                              '完了',
                              style: saveButtonTextStyle,
                            ),
                          )))
                ],
              ),
            ],
          )),
    );
  }

  //タスク保存処理
  _saveTask(BuildContext context, WidgetRef ref) {
    final taskName = titleTextEditingController.text;
    final userId = MainViewModel.userId;
    final taskListViewModel = ref.watch(taskListViewModelProvider);
    if (_form.currentState == null) {
      print("_formKey.currentState is null!");
    } else if (!_form.currentState!.validate()) {
      return;
    } else {
      _form.currentState!.save();
      // if (isEdit) {
      //   taskListViewModel.editTask(todoTask, taskName ,viewModel.userId, isCalenderTask);
      // } else {
      taskListViewModel.saveTask(userId,taskName);
      // }
      //
      Navigator.pop(context);
      // }
    }
  }

    String _selectDayText(BuildContext context) {
      //TODO: 仮で
      return " 明日";
      // final viewModel = context.read<AddTaskViewModel>();
      // final selectedDay = viewModel.selectedDay;
      // print(selectedDay);
      //
      // if (_isToday(selectedDay)) {
      //   return "今日";
      // } else if (_isTomorrow(selectedDay)) {
      //   return "明日";
      // } else {
      //   return DateTimeFormat.dateWeekdayJP(selectedDay);
      // }
    }


    bool _isToday(DateTime selectedDay) {
      final _now = DateTime.now();
      return (selectedDay.year == _now.year &&
          selectedDay.month == _now.month &&
          selectedDay.day == _now.day);
    }

    bool _isTomorrow(DateTime selectedDay) {
      final _now = DateTime.now();
      return (selectedDay.year == _now.year &&
          selectedDay.month == _now.month &&
          selectedDay.day == _now.day + 1);
    }
  }
