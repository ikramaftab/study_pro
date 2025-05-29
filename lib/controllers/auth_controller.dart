import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty");
      return;
    }

    isLoading.value = true;

    // Simulated delay for login
    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;

    // Simulated success
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true); // ✅ Save login status

    Get.offNamed('/home');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // ✅ Clear login status
    Get.offAllNamed('/login'); // ✅ Navigate to login screen
  }
}
