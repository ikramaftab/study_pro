import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes", style: GoogleFonts.lora(color: Colors.white)),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreenAccent.shade700, Colors.deepPurple.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return OpenContainer(
              closedElevation: 5,
              transitionType: ContainerTransitionType.fadeThrough,
              closedColor: Colors.deepPurpleAccent,
              closedBuilder: (context, action) => Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  title: Text("Chapter ${index + 1}", style: GoogleFonts.lora(fontSize: 18)),
                  subtitle: Text("Important notes", style: GoogleFonts.lora(color: Colors.grey.shade700)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              openBuilder: (context, action) => Scaffold(
                appBar: AppBar(title: Text("Chapter ${index + 1} Notes")),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Key Points", style: GoogleFonts.lora(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text("- Summary of Chapter ${index + 1}\n- Important formulas\n- Key concepts", style: GoogleFonts.lora(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}