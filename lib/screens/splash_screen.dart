import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Animation with Increased Size
                ZoomIn(
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 400, // Bigger logo
                  ),
                ),
                const SizedBox(height: 50),
                // Animated Button
                _showButton
                    ? BounceInUp(
                  child: GestureDetector(
                    onTap: () {
                      print("object");
                      // Add navigation logic
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14), // Reduced size
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), // Adjusted shape
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6, // Softer shadow
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.lora(
                          fontSize: 18, // Adjusted text size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
