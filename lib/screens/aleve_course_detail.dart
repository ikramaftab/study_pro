import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';
import 'package:flutter/widgets.dart';

class ALevelCourseDetailScreen extends StatefulWidget {
  const ALevelCourseDetailScreen({super.key});

  @override
  _ALevelCourseDetailScreenState createState() => _ALevelCourseDetailScreenState();
}

class _ALevelCourseDetailScreenState extends State<ALevelCourseDetailScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> subjects = [
    "Mathematics",
    "Physics",
    "Chemistry",
    "Biology",
    "Computer Science",
    "Economics",
    "Accounts",
    "Business Studies",
    "Urdu",
    "English"
  ];

  List<String> filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    filteredSubjects = subjects;
  }

  void _filterSubjects(String query) {
    setState(() {
      filteredSubjects = subjects
          .where((subject) => subject.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Background Section
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
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                top: 180,
                left: 20,
                child: Text(
                  "A-Level Subjects",
                  style: GoogleFonts.lora(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterSubjects,
              decoration: InputDecoration(
                hintText: "Search Subject...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Subject List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredSubjects.length,
              itemBuilder: (context, index) {
                return _subjectCard(filteredSubjects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _subjectCard(String subject) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(
          subject,
          style: GoogleFonts.lora(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          _resourceTile("Notes", Icons.menu_book, Colors.blueAccent),
          _resourceTile("Past Papers", Icons.description, Colors.orange),
          _resourceTile("Video Lectures", Icons.play_circle_fill, Colors.green),
          const SizedBox(height: 10),
          _plannerOptions(),
        ],
      ),
    );
  }

  Widget _resourceTile(String title, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: GoogleFonts.lora(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {},
    );
  }

  Widget _plannerOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _plannerButton("1 Month"),
          _plannerButton("3 Months"),
          _plannerButton("6 Months"),
        ],
      ),
    );
  }

  Widget _plannerButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        title,
        style: GoogleFonts.lora(fontSize: 14, color: Colors.white),
      ),
    );
  }
}