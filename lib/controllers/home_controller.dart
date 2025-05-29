import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = "Ikram".obs;

  var courses = [
    {'title': 'A-Levels', 'color': 0xFF448AFF},
    {'title': 'O-Levels', 'color': 0xFF448AFF},
    {'title': 'IGCSE', 'color':0xFF448AFF},
    {'title': 'MDCAT', 'color': 0xFF448AFF},
    {'title': 'ECAT', 'color': 0xFF448AFF},
    {'title': 'SAT', 'color': 0xFF448AFF},
    {'title': 'PLANNERS', 'color': 0xFF448AFF},
  ].obs;

  var searchQuery = ''.obs;

  List<Map<String, dynamic>> get filteredCourses {
    final query = searchQuery.value.trim().toLowerCase();

    if (query.isEmpty) return courses;

    return courses.where((course) {
      final title = course['title']?.toString().toLowerCase() ?? '';
      return title.contains(query);
    }).toList();
  }
}
