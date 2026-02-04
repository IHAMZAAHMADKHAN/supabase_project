import 'package:flutter/material.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/screen/authscreen/register/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Register Screen')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  model.state == ViewState.busy
                      ? Center(child: CircularProgressIndicator())
                      : TextFormField(
                          controller: model.emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),

                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: model.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  model.state == ViewState.busy
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: model.isLoading ? null : model.register,
                          child: Text("Register"),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
