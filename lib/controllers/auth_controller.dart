import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    isLoggedIn.value = box.read('isLoggedIn') ?? false;
  }

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty");
      return;
    }

    isLoading.value = true;

    // Simulated delay for login
    await Future.delayed(Duration(seconds: 2));

    isLoading.value = false;
    isLoggedIn.value = true;
    
    // Save login status
    await box.write('isLoggedIn', true);
    await box.write('userEmail', email); // Optionally save user email

    Get.offNamed('/home');
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      
      // Clear all stored data
      await box.erase();
      
      // Reset state
      isLoggedIn.value = false;
      
      // Navigate to login screen
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to logout. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
