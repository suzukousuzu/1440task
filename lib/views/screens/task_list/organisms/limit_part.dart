import 'package:flutter/material.dart';
import 'package:ringrin_1440task/views/screens/task_list/modules/rich_day_text.dart';
import 'package:ringrin_1440task/views/screens/task_list/modules/setting_bed_time.dart';

import '../../../constants/constant_color.dart';
import '../../../constants/style.dart';
import '../modules/task_list_count_down_part.dart';


class LimitPart extends StatelessWidget {
  const LimitPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
         SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.13,
                ),
                //日付パート
                const RichDayText(),

                //就寝時間設定パート
                const SettingBedTime()
              ],
            ),

          ),
        ),
        //1440分のcountdownパート
        const TaskListCountDownPart()
      ],
    );
  }
}
