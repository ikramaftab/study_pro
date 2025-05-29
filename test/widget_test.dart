import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:study_pro/main.dart';
import 'package:study_pro/routes/app_routes.dart';
import 'package:study_pro/controllers/auth_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetStorage.init();
    final box = GetStorage();
    box.erase(); // Clear previous values before test
    box.write('isLoggedIn', false);
  });

  testWidgets('Login screen navigates to home on successful login', (WidgetTester tester) async {
    // Inject AuthController for test (if not auto-bound)
    Get.put(AuthController());

    // Start app from login screen
    await tester.pumpWidget(MyApp(initialRoute: AppRoutes.login));

    // Let UI build
    await tester.pumpAndSettle();

    // Find the email and password fields
    final emailField = find.byType(TextField).at(0);
    final passwordField = find.byType(TextField).at(1);
    final loginButton = find.widgetWithText(ElevatedButton, 'Log In');

    // Enter login credentials
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');

    // Tap login button
    await tester.tap(loginButton);

    // Wait for simulated login delay
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Expect to land on home screen
    expect(find.text('COURSES'), findsOneWidget);
    expect(find.textContaining('Hi,'), findsOneWidget);
  });
}
