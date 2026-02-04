import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/core/others/base_view_model.dart';

class AddNotesViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final supabase = Supabase.instance.client;

  addNotes() async {
    setState(ViewState.busy);
    try {
      await supabase.from('notes').insert({
        'title': titleController.text,
        'description': descriptionController.text,
      });
      Get.back();
    } catch (e) {
      print('Error adding note: $e');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
