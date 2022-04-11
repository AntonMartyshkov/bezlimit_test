import 'package:bezlimit_test/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen(
      {Key? key, required this.controller, required this.selectedItemPosition})
      : super(key: key);

  final HomeController controller;
  final int selectedItemPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: controller.textEditingController,
                keyboardType: TextInputType.number,
                onSubmitted: (t) => validateInput(),
              ),
            ),
            ElevatedButton(
                child: const Text("Сохранить"),
                onPressed: () => validateInput()),
          ],
        ),
      ),
    );
  }

  validateInput() {
    if (controller.textEditingController.text.isNotEmpty) {
      var value = double.parse(controller.textEditingController.text);
      if (value <= double.maxFinite.toInt() - 1) {
        Get.back();
        controller.moveToPickedElement(value);
      } else {
        showMessage('value should be less than ${double.maxFinite.toInt()}');
      }
    } else {
      showMessage('value can\'t be empty');
    }
  }

  showMessage(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.showSnackbar(GetSnackBar(
        title: 'error',
        message: message,
        duration: const Duration(seconds: 1)));
  }
}
