import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Obx(
            //   () {
            //     final isLoggedIn = AuthService.to.isLoggedInValue;
            //     return Text(
            //       'You are currently:'
            //       ' ${isLoggedIn ? "Logged In" : "Not Logged In"}'
            //       "\nIt's impossible to enter this "
            //       "route when you are logged in!",
            //       textAlign: TextAlign.center,
            //     );
            //   },
            // ),
            Text("Login Screen", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              onPressed: () {
                AuthService.to.login();
                final thenTo = context.params['then'];
                Get.offNamed(thenTo ?? '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
