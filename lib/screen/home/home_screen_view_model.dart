import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/core/others/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> notes = [];
  getNotes() async {
    try {
      final result = await supabase.from('notes').select();
      notes = result;
      notifyListeners();
    } catch (e) {
      print('Error fetching notes: $e');
    }
  }

  // to delete a note

  deleteNote(int id) async {
    try {
      await supabase.from('notes').delete().eq('id', id);
      // Refresh notes after deletion
      await getNotes();
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
}
