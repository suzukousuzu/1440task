import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ringrin_1440task/views/constants/constant_color.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

const _tabBarHeight = 40.0;

class TaskListTabBar extends StatelessWidget {
  const TaskListTabBar({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ..._date.map((e) => Expanded(
              child: InkWell(
                onTap: () {
                  onChanged(e);
                },
                child: Container(
                  height: _tabBarHeight,
                  decoration: BoxDecoration(
                    color: _tabBarColor(e),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Center(child: Text(e)),
                  ),
                ),
              ),
            ))
        // Expanded(
        //   child: InkWell(
        //     onTap: () {
        //       print('tap');
        //     },
        //     child: Container(
        //       height: _tabBarHeight,
        //       decoration: BoxDecoration(
        //         color: ConstantColor.green04,
        //         borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(10),
        //           topRight: Radius.circular(10),
        //         ),
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.only(bottom: 4.0),
        //         child: Center(child: Text('今日')),
        //       ),
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: Container(
        //     height: _tabBarHeight,
        //     decoration: BoxDecoration(
        //       color: ConstantColor.green05,
        //       borderRadius: const BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(bottom: 4.0),
        //       child: Center(child: Text('明日')),
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: Container(
        //     height: _tabBarHeight,
        //     decoration: BoxDecoration(
        //       color: ConstantColor.green06,
        //       borderRadius: const BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(bottom: 4.0),
        //       child: Center(child: Text('明後日')),
        //     ),
        //   ),
        // ),
      ],
    );
    //   DefaultTabController(
    //   length: 3,
    //   initialIndex: 0,
    //   child: TabBar(
    //     tabs: [
    //       Container(
    //         color: ConstantColor.baseColor,
    //         width: double.infinity,
    //           child: Center(child: Text("今日"))),
    //       Text("明日"),
    //       Text("明後日"),
    //     ],
    //     // indicator: RectangularIndicator(
    //     //   bottomLeftRadius: 0,
    //     //   bottomRightRadius: 0,
    //     //   topLeftRadius: 8,
    //     //   topRightRadius: 8,
    //     //   //paintingStyle: PaintingStyle.stroke,
    //     // ),
    //   ),
    // );
  }

  Color _tabBarColor(String e) {
    switch (e) {
      case '今日':
        return ConstantColor.green04;
      case '明日':
        return ConstantColor.green05;
      case '明後日':
        return ConstantColor.green06;
      default:
        return ConstantColor.baseColor;
    }
  }
}

const _date = ['今日', '明日', '明後日'];
