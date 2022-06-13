import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_view_model.dart';

import '../../../../utils/functions/create_time_ago.dart';
import '../../../constants/constant_color.dart';
import '../atoms/timer_part.dart';


class TaskListCountDownPart extends HookConsumerWidget {
  const TaskListCountDownPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(taskListViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        linearStrokeCap: LinearStrokeCap.butt,
        center: TimerPart(
          ref
        ),
        lineHeight: 68.0,
        animation: true,
        animationDuration: 1200,
        percent:
        (86400 - createTimeAgo(viewModel.bedDateTime)) / 86400,
        linearGradient: LinearGradient(
            colors: [ConstantColor.grey03, ConstantColor.grey03]),
        linearGradientBackgroundColor: const LinearGradient(
            colors: [Color(0xFF78D0AB), Color(0xFF138C88)]),
      ),
    );
  }
}
