import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ringrin_1440task/views/screens/task_list/task_list_view_model.dart';

import '../../../../utils/functions/create_time_ago.dart';
import '../../../constants/constant_color.dart';


class TimerPart extends StatefulWidget {
  final WidgetRef ref;
  TimerPart(this.ref);

  @override
  _TimerPartState createState() => _TimerPartState();
}

class _TimerPartState extends State<TimerPart> {
  Timer? _timer;
  int _currentSeconds = 1;
  bool isSetSelectedDateTime = false;

  bool isOnlyTime = false;

  @override
  void initState() {
    super.initState();

    _timer = countTimer();
  }

  Timer? countTimer() {
    return Timer.periodic(Duration(seconds: 1), (timer) {
      // if (_currentSeconds < 1) {
      //   timer.cancel();
      // } else {
      setState(() {
        _currentSeconds = _currentSeconds - 1;
      });
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // final mainViewModel = context.read<MainViewModel>();
    // if (_currentSeconds == 0) {
    //   Future(() => mainViewModel.refreshSetDateTime(widget.date));
    // }
    final viewModel = widget.ref.watch(taskListViewModelProvider);
    //todo ()のなかは後ほど設定
    _currentSeconds = createTimeAgo(viewModel.bedDateTime);
    int displayMinuteTime = _currentSeconds ~/ 60;
    int displaySecondsTime = _currentSeconds % 60;

    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(style: DefaultTextStyle
          .of(context)
          .style, children: [
        TextSpan(
            text: "残り", style: TextStyle(fontSize: 20.0, color: ConstantColor.whiteColor, fontWeight: FontWeight.bold)),
        TextSpan(text: displayMinuteTime.toString(),
            style: TextStyle(color: ConstantColor.whiteColor, fontSize: 44.0, fontWeight: FontWeight.bold)),
        TextSpan(
            text: " 分", style: TextStyle(fontSize: 20.0, color: ConstantColor.whiteColor, fontWeight: FontWeight.bold)),
        TextSpan(text: displaySecondsTime.toString(),
            style: TextStyle(color: ConstantColor.whiteColor, fontSize: 44.0, fontWeight: FontWeight.bold)),
        TextSpan(
            text: " 秒", style: TextStyle(fontSize: 20.0, color: ConstantColor.whiteColor, fontWeight: FontWeight.bold)),
      ]),
    );
  }


}

