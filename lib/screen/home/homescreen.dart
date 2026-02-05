import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/screen/home/home_screen_view_model.dart';
import 'package:supabase_project/screen/notes/add_notes_screen.dart';
import 'package:supabase_project/screen/update/update_sceen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Home Screen')),
            body: StreamBuilder<List<Map<String, dynamic>>>(
              stream: Supabase.instance.client
                  .from('notes')
                  .stream(primaryKey: ['id']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No Notes Found"));
                }

                final notes = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];

                      return ListTile(
                        onTap: () {
                          Get.to(() => UpdateSceen(), arguments: note);
                        },
                        title: Text(note['title']),
                        subtitle: Text(note['description']),
                        trailing: IconButton(
                          onPressed: () {
                            model.deleteNote(note['id']);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                );
              },
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
