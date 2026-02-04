import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/core/others/base_view_model.dart';
import 'package:supabase_project/screen/home/homescreen.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final supabase = Supabase.instance.client;
  bool isLoading = false;

  Future<void> login() async {
    // setState(() => isLoading = true);
    setState(ViewState.busy);

    try {
      final result = await supabase.auth.signInWithPassword(
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
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
