import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';
import 'package:supabase_project/screen/home/home_screen_view_model.dart';
import 'package:supabase_project/screen/notes/add_notes_screen.dart';
import 'package:supabase_project/screen/update/update_sceen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final note = Get.arguments as Map<String, dynamic>;
    return ChangeNotifierProvider(
      create: (context) {
        final vm = HomeScreenViewModel();
        vm.getNotes();
        return vm;
      },
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Home Screen')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  for (var note in model.notes)
                    ListTile(
                      onTap: () {
                        Get.to(() => UpdateSceen(), arguments: note);
                      },
                      title: Text(note['title']),
                      subtitle: Text(note['description']),
                      trailing: IconButton(
                        onPressed: () {
                          model.deleteNote(note['id']);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => const AddNotesScreen());
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
