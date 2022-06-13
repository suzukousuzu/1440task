import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/constant_color.dart';
import '../../../constants/style.dart';
import '../common/show_bed_time_setting_dialog.dart';
import '../task_list_view_model.dart';

class SettingBedTime extends HookConsumerWidget {
  const SettingBedTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(taskListViewModelProvider);

    return GestureDetector(
      onTap: () => showBedTimeSettingDialog(context, ref),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Stack(
          children: [
            SizedBox(
              width: 80.0,
              height: 40.0,
              child: Image.asset(
                "assets/icons/time_display_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 2.0,
              left: 6.0,
              right: 6.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${viewModel.selectedTime.hour}:${viewModel.selectedTime.minute.toString().padLeft(2, '0')}",
                      style: regularStyle,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: FaIcon(
                          FontAwesomeIcons.pen,
                          color: ConstantColor.whiteColor,
                          size: 12.0,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
