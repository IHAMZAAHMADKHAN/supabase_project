import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_project/core/constants/colors.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/core/widgets/app_primary_button.dart';
import 'package:supabase_project/screen/notes/add_notes_view_model.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddNotesViewModel(),
      child: Consumer<AddNotesViewModel>(
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
                            title: 'Add Note',
                            onPressed: () {
                              model.addNotes();
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
