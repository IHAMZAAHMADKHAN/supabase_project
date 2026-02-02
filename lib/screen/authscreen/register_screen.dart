import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/screen/homescreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final supabase = Supabase.instance.client;
  Future<void> register() async {
    setState(() => isLoading = true);

    try {
      final result = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      if (result.user != null && result.session != null) {
        //Navigate after login
        Get.offAll(() => const Homescreen());
      }
    } catch (e) {
      print('Error during login: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: isLoading ? null : register,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
