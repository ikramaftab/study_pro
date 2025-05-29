import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures", style: GoogleFonts.lora(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade600,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(Icons.play_circle_fill, color: Colors.white, size: 35),
                title: Text("Lecture ${index + 1}", style: GoogleFonts.lora(color: Colors.white)),
                subtitle: Text("Video Lecture", style: GoogleFonts.lora(color: Colors.white70)),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}