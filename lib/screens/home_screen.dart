import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_pro/screens/user_profile.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Section with Background
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
                          // Top Row with Menu & Profile
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.menu, color: Colors.white, size: 30),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "COURSES",
                                  style: GoogleFonts.lora(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child:  CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 22,
                                  child: IconButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const UserProfileScreen()));
                                  },icon: const Icon(Icons.person,color: Colors.black,size: 28,) )
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Greeting Text
      
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hi, Ikram",
                              style: GoogleFonts.lora(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Search Bar
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
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
      
                // Course Categories Section
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 5),
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
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 2.5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          _courseCard("A-Levels", Colors.blueAccent),
                          _courseCard("O-Levels", Colors.purpleAccent),
                          _courseCard("IGCSE", Colors.teal),
                          _courseCard("MDCAT", Colors.redAccent),
                          _courseCard("ECAT", Colors.orange),
                          _courseCard("SAT", Colors.green),
                          _courseCard("PLANNERS", Colors.black38)
      
                        ],
                      ),
                      const SizedBox(height: 130),
                      // Bottom Text
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
      ),
    );
  }
  Widget _courseCard(String title, Color color) {
    return GestureDetector(

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

}
