import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_view_model.dart';

import '../../../constants/constant_color.dart';


const List<String> priority =  ["高", "中", "低", "優先度なし"];

class PriorityPickerPart extends HookConsumerWidget {
  final bool isEdit;

  PriorityPickerPart({required this.isEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListViewModel = ref.watch(taskListViewModelProvider);
    return CupertinoButton(
      child: Container(
        width: 112,
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
            Icon(
              Icons.flag,
              color: ConstantColor.whiteColor,
              size: 20.0,
            ),
            Text(
             _priorityText(context, ref),
              style: TextStyle(fontSize: 14.0, color: ConstantColor.whiteColor),
            )
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 240.0,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoButton(
                        child: SizedBox(
                            width: 92.0,
                            child: Text(
                              "キャンセル",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: ConstantColor.grey01),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                            initialItem:
                            taskListViewModel.selectedPriorityIndex),
                        itemExtent: 42.0,
                        onSelectedItemChanged: (int index) {
                          //TODO: 後で
                          //addTaskViewModel.changeIndex(index);
                        },
                        children: priority.map((pri) => new Text(pri)).toList(),
                      ),
                    ),
                    CupertinoButton(
                        child: SizedBox(
                            width: 92.0,
                            child: Text("完了",textAlign: TextAlign.end,
                                style:
                                TextStyle(color: ConstantColor.baseColor))),
                        onPressed: () {
                          //TODO 後で
                          // addTaskViewModel.selectedPriorityIndex =
                          //     addTaskViewModel.changedPriorityIndex;
                          // addTaskViewModel.equalIndex();

                          Navigator.pop(context);
                        }),
                  ],
                ),
              );
            });
      },
    );
  }

  //優先度の表示
  String _priorityText(BuildContext context, WidgetRef ref) {
    final taskListViewModel = ref.watch(taskListViewModelProvider);
    if (taskListViewModel.selectedPriorityIndex == 0) {
      return "優先度高";
    } else if (taskListViewModel.selectedPriorityIndex == 1) {
      return "優先度中";
    } else if (taskListViewModel.selectedPriorityIndex == 2) {
      return "優先度低";
    } else {
      return "優先度なし";
    }
  }
}
