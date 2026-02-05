import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_project/core/others/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> notes = [];

  //this is user to get notes from supabase
  // Future<void> getNotes() async {
  //   try {
  //     final result = await supabase.from('notes').select();
  //     notes = result;
  //     notifyListeners();
  //   } catch (e) {
  //     print('Error fetching notes: $e');
  //   }
  // }

  // real time fuction

  // Future<void> getNotes() async {
  //   try {
  //     supabase.from('notes').stream(primaryKey: ['id']).listen((data) {
  //       notes = data;
  //       notifyListeners();
  //     });
  //   } catch (e) {
  //     print('Error fetching notes: $e');
  //   }
  // }

  // now use stream builder in homescreen

  // to delete a note

  Future<void> deleteNote(int id) async {
    try {
      await supabase.from('notes').delete().eq('id', id);
      // Refresh notes after deletion
      //  await getNotes();   // uncomment this if you are not using stream builder
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
}
