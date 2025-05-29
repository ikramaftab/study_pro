import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeMode? themeMode;
  final String? initialRoute;

  MyApp({this.themeMode, this.initialRoute});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isDark = box.read('isDarkMode') ?? false;
    ThemeMode finalMode = themeMode ?? (isDark ? ThemeMode.dark : ThemeMode.light);
    String route = initialRoute ?? AppRoutes.splash;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: finalMode,
      initialRoute: route,
      getPages: AppRoutes.routes,
    );
  }
}

