import 'package:flutter/material.dart';

import '../../../constants/constant_color.dart';
import '../../../constants/style.dart';

class RichDayText extends StatelessWidget {
  const RichDayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _now = DateTime.now();
    return RichText(
      text: TextSpan(
        style: dayTextStyle,
        children: [
          TextSpan(
              text: _now.year.toString(),
              style: TextStyle(color: ConstantColor.baseColor, fontSize: 20)),
          const TextSpan(
            text: '年',
          ),
          TextSpan(
              text: _now.month.toString(),
              style: TextStyle(
                  color: ConstantColor.baseColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          const TextSpan(
            text: '月',
          ),
          TextSpan(
              text: _now.day.toString(),
              style: TextStyle(
                  color: ConstantColor.baseColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          const TextSpan(
            text: '日',
          ),
          TextSpan(
            text: '(${_textWeekDay(_now)})',
          ),
        ],
      ),
    );
  }

  String _textWeekDay(DateTime date) {
    final weekDay = date.weekday;
    switch (weekDay) {
      case 1:
        return "月";
      case 2:
        return "火";
      case 3:
        return "水";
      case 4:
        return "木";
      case 5:
        return "金";
      case 6:
        return "土";
      case 7:
        return "日";
      default:
        return "その他";
    }
  }
}
