import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../controllers/auth_controller.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _buildDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        // Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                            ),
                            Text(
                              "COURSES",
                              style: GoogleFonts.lora(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 22,
                                child: IconButton(
                                  onPressed: () => Get.toNamed('/profile'),
                                  icon: const Icon(Icons.person, color: Colors.black, size: 28),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Obx(() => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hi, ${homeController.userName.value}",
                            style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            onChanged: (val) => homeController.searchQuery.value = val,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search, color: Colors.grey),
                              hintText: "Search Courses",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Course Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available Courses",
                      style: GoogleFonts.lora(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      final filtered = homeController.filteredCourses;
                      if (filtered.isEmpty) {
                        return const Center(child: Text("No courses found", style: TextStyle(color: Colors.grey)));
                      }
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: filtered.map((course) {
                          return _courseCard(course['title'], Color(course['color']));
                        }).toList(),
                      );
                    }),
                    const SizedBox(height: 130),
                    Center(
                      child: Text(
                        "Start Learning Now",
                        style: GoogleFonts.lora(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courseCard(String title, Color color) {
    return GestureDetector(
      onTap: () => Get.snackbar("Course Selected", "You selected $title"),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lora(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final box = GetStorage();
    bool isDark = box.read('isDarkMode') ?? false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Study Pro",
                    style: GoogleFonts.lora(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () => Get.toNamed('/profile'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () => Get.toNamed('/settings'),
              ),
              SwitchListTile(
                secondary: const Icon(Icons.brightness_6),
                title: const Text("Dark Theme"),
                value: isDark,
                onChanged: (val) {
                  setState(() {
                    isDark = val;
                  });
                  box.write('isDarkMode', val);
                  Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textCancel: "Cancel",
                    textConfirm: "Logout",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      box.write('isLoggedIn', false);
                      Get.offAllNamed('/login');
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
