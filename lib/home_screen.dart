import 'package:bezlimit_test/home_controller.dart';
import 'package:bezlimit_test/widgets/background_image.dart';
import 'package:bezlimit_test/widgets/horizontal_item.dart';
import 'package:bezlimit_test/widgets/stub_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            controller: homeController.contentScrollController,
            child: Padding(
              padding: const EdgeInsets.only(top: Constants.circleSize / 1.5),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade400,
                ),
                height: context.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const StubWidget(),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: Constants.horItemSize,
                      child: GetBuilder<HomeController>(
                          id: 'listBuilder',
                          builder: (GetxController controller) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemExtent: Constants.horItemSize,
                              controller:
                                  homeController.horizontalScrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: double.maxFinite.toInt(),
                              itemBuilder: (context, i) {
                                return HorizontalItem(itemPos: i);
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
