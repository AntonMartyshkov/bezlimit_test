import 'package:bezlimit_test/home_controller.dart';
import 'package:bezlimit_test/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -Constants.circleSize / 2.2,
        left: -Constants.circleSize / 2.2,
        child: GetBuilder(
            id: 'rotateBuilder',
            builder: (HomeController ctrl) {
              return Transform.rotate(
                  angle: ctrl.scrollOffset.value,
                  child: SvgPicture.asset(
                    'assets/circle.svg',
                    width: Constants.circleSize,
                  ));
            }));
  }
}
