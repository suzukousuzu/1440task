import 'package:flutter/material.dart';

import '../../../constants/constant_color.dart';


class IntroButton extends StatelessWidget {
  const IntroButton({required this.index, required this.buttonName, required this.onTap, required this.skip});
  final int index;
  final String buttonName;
  final void Function() onTap;
  final void Function() skip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 42.0, left: 42.0, bottom: 64.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 36.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ConstantColor.baseColor,
                border: Border.all(color: ConstantColor.baseColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text(buttonName, style: TextStyle(fontSize: 16.0, color: Colors.white),)),
            ),
          ),
          index == 3 ? Container(height: 48.0,)
              : TextButton(
            onPressed: skip,
            child: Text("スキップ", style: TextStyle(fontSize: 16.0,color: ConstantColor.baseColor ),),
          )
        ],
      ),
    );
  }
}
