import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastPapersScreen extends StatelessWidget {
  const PastPapersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Past Papers", style: GoogleFonts.lora(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade900, Colors.teal.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.teal.shade700,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(Icons.file_present, color: Colors.white),
                title: Text("Year ${2017 + index}", style: GoogleFonts.lora(color: Colors.white)),
                subtitle: Text("Exam Papers", style: GoogleFonts.lora(color: Colors.white70)),
                trailing: const Icon(Icons.download, color: Colors.white),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
