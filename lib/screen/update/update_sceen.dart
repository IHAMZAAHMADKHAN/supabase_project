import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';
import 'package:supabase_project/core/constants/colors.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/core/widgets/app_primary_button.dart';
import 'package:supabase_project/screen/update/update_view_model.dart';

class UpdateSceen extends StatelessWidget {
  const UpdateSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final note = Get.arguments as Map<String, dynamic>;
    return ChangeNotifierProvider(
      create: (context) => UpdateViewModel(note: note),
      child: Consumer<UpdateViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Add Notes')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: model.titleController,
                      decoration: const InputDecoration(
                        labelText: 'title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: model.descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    model.state == ViewState.busy
                        ? Center(child: CircularProgressIndicator())
                        : AppPrimaryButton(
                            title: 'Update Note',
                            onPressed: () {
                              model.updateNotes();
                            },
                            backgroundColor: skyBlueColor,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
