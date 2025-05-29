import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          // Obx(() => SwitchListTile(
          //   title: const Text("Dark Theme"),
          //   value: controller.isDarkMode.value,
          //   onChanged: (val) => controller.toggleTheme(),
          // )),
          ListTile(
            title: const Text("App Info"),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: "StudyPro",
              applicationVersion: "1.0.0",
              applicationLegalese: "© 2025 StudyPro",
            ),
          ),
        ],
      ),
    );
  }
}
