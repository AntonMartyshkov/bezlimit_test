import 'package:bezlimit_test/select_screen.dart';
import 'package:bezlimit_test/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var scrollOffset = 0.0.obs;
  int? selectedItemPosition;

  final ScrollController horizontalScrollController = ScrollController();
  final ScrollController contentScrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  onInit() {
    contentScrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  onClose() {
    contentScrollController.removeListener(scrollListener);
    super.onClose();
  }

  scrollListener() {
    offsetChanged(contentScrollController.offset);
  }

  offsetChanged(double newValue) {
    if (Constants.circleSize ~/ 1.5 == newValue.toInt()) {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
      Get.showSnackbar(const GetSnackBar(
          title: 'Info',
          message: 'Top corner',
          duration: Duration(seconds: 1)));
    }
    scrollOffset.value = -newValue / 180;
    update(['rotateBuilder']);
  }

  moveToPickedElement(double pos) {
    selectedItemPosition = pos.toInt();
    horizontalScrollController.animateTo(pos * (Constants.horItemSize),
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    update(['listBuilder']);
  }

  itemSelected(int pos) {
    textEditingController.text = pos.toString();
    Get.to(() => SelectScreen(controller: this, selectedItemPosition: pos));
  }
}
