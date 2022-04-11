import 'package:bezlimit_test/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class HorizontalItem extends GetView<HomeController> {
  const HorizontalItem({Key? key, required this.itemPos}) : super(key: key);

  final int itemPos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.horItemPadding),
      child: InkWell(
        onTap: () => controller.itemSelected.call(itemPos),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black),
              color: controller.selectedItemPosition != null &&
                      controller.selectedItemPosition == itemPos
                  ? Colors.amberAccent
                  : Colors.white,
            ),
            child: Center(child: Text(itemPos.toString()))),
      ),
    );
  }
}
