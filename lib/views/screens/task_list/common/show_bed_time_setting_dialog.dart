import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/constant_color.dart';
import '../task_list_view_model.dart';


showBedTimeSettingDialog(BuildContext context, WidgetRef ref) async {
  final viewModel = ref.watch(taskListViewModelProvider);

  Picker ps = Picker(
      adapter: NumberPickerAdapter(data: [
        NumberPickerColumn(
          initValue: viewModel.selectedTime.hour,
          onFormatValue: (v) {
            return v < 10 ? "0$v" : "$v";
          },
          begin: 0,
          end: 23,
        ),
        NumberPickerColumn(
            initValue: viewModel.selectedTime.minute,
            onFormatValue: (v) {
              return v < 10 ? "0$v" : "$v";
            },
            begin: 0,
            end: 59),
      ]),
      delimiter: [
        PickerDelimiter(
            child: Container(
              width: 30.0,
              alignment: Alignment.center,
              child: const Text(
                ":",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ))
      ],
      hideHeader: true,
      selectedTextStyle: TextStyle(
          color: ConstantColor.baseColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold),
      onConfirm: (Picker picker, List value) {
         viewModel.pickedTime(value[0], value[1]);

         //就寝時間をローカルDBに保存
        viewModel.setBedTime();
      });

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child:  Text(
                "就寝は何時ですか？",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              )),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ps.makePicker(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "キャンセル",
                            style: TextStyle(color: ConstantColor.grey01),
                          )),
                      const SizedBox(
                        width: 16.0,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ps.onConfirm!(ps, ps.selecteds);
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(color: ConstantColor.baseColor),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });

}