import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/core/enums/view_state_model.dart';
import 'package:supabase_project/core/others/base_view_model.dart';

class UpdateViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final supabase = Supabase.instance.client;
  late Map<String, dynamic> note;

  UpdateViewModel({required this.note}) {
    titleController.text = note['title'] ?? "";
    descriptionController.text = note['description'] ?? "";
  }

  Future<void> updateNotes() async {
    setState(ViewState.busy);
    try {
      await supabase
          .from('notes')
          .update({
            'title': titleController.text,
            'description': descriptionController.text,
          })
          .eq('id', note['id']);
      Get.back(result: true);
    } catch (e) {
      print('Error updating note: $e');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  // void initState() {
  //   titleController.text = note['title'] ?? "";
  //   descriptionController.text = note['description'] ?? "";
  //   super.initState();
  // }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
