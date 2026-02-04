import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/screen/authscreen/login/login_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: "https://mihvtsfdkjbnllvakctg.supabase.co",
    anonKey: "sb_publishable_sgS69X4A4n9HexSQXqU96Q_277ypjzC",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SupaBase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
