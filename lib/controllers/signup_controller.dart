import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  final nameController = ''.obs;
  final emailController = ''.obs;
  final passwordController = ''.obs;

  void signUp() {
    if (nameController.isEmpty ||
        emailController.isEmpty ||
        passwordController.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    isLoading.value = true;

    // Simulate delay
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offNamed('/home');
    });
  }
}
