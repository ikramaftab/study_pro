import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final box = GetStorage();
  var isDarkMode = false.obs;

  @override
  void onInit() {
    isDarkMode.value = box.read('isDarkMode') ?? false;

    Future.delayed(Duration.zero, () {
      Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    });

    super.onInit();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    box.write('isDarkMode', isDarkMode.value);

    // 🔁 Apply immediately
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
