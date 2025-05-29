import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_pro/screens/IGCSE_detail.dart';
import 'package:study_pro/screens/aleve_course_detail.dart';
import 'package:study_pro/screens/olevel_course_detail.dart';

import '../routes/app_routes.dart';
import '../widgets/widgets.dart';
import 'login_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 10),

              // Profile Picture
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/ikram.jpg"),
                ),
              ),
              const SizedBox(height: 10),

              // User Name & Email
              Text(
                "Ikram Bhatti",
                style: GoogleFonts.lora(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "ikram@example.com",
                style: GoogleFonts.lora(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 15),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text("Edit Profile", style: GoogleFonts.lora(fontSize: 16, color: Colors.white)),
              ),

              const SizedBox(height: 20),

              // Learning Progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Learning Progress",
                      style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.6,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.blueAccent,
                      minHeight: 10,
                    ),
                    const SizedBox(height: 5),
                    Text("60% Completed", style: GoogleFonts.lora(color: Colors.grey.shade700)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Enrolled Courses
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enrolled Courses",
                      style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
    onTap: () => Get.toNamed('/alevel-detail'),
    child: _courseTile("A-Levels")),
                    GestureDetector(
    onTap: () => Get.toNamed('/olevel-detail'),
                        child: _courseTile("O-Levels")),
                    GestureDetector(
                        onTap: () => Get.toNamed('/igcse-detail'),
                        child: _courseTile("IGCSE")),
                  ],
                ),
              ),

              const Spacer(),

              // Settings & Logout
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.blueAccent),
                title: Text("Settings", style: GoogleFonts.lora(fontSize: 16)),
                onTap: () => Get.toNamed('/settings'),

              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: Text("Logout", style: GoogleFonts.lora(fontSize: 16)),
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to log out?",
                    textCancel: "Cancel",
                    textConfirm: "Logout",
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove('isLoggedIn'); // 🧽 Clear persistent login
                      Get.offAllNamed('/login');        // 🚪 Go back to login
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _courseTile(String courseName) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blueAccent.shade100,
      child: ListTile(
        title: Text(
          courseName,
          style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
      ),
    );
  }
}
