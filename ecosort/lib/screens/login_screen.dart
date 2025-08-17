// File: lib/screens/login_screen.dart

import 'package:ecosort/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final UserController userController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Selamat Datang Kembali!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic
                userController.setEmail(emailController.text);
                Get.off(() => HomeScreen()); // Navigate to home screen on successful login
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
              child: const Text('Belum punya akun? Daftar di sini'),
            ),
          ],
        ),
      ),
    );
  }
}