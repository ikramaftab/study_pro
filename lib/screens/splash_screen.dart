import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      bool isLoggedIn = box.read('isLoggedIn') ?? false;

      if (isLoggedIn) {
        Get.offNamed('/home'); // ✅ Navigate to home if logged in
      } else {
        Get.offNamed('/login'); // 🚪 Otherwise show welcome/login flow
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Centered Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with Animation
                  ZoomIn(
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 400,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Placeholder or future content (like button)
                  const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
