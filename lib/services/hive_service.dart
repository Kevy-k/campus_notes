import 'package:campus_notes/models/note_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  final box = Hive.box<Note>('notes');

  List<Note> getNotes() {
    return box.values.toList();

  }
  Future<void> addNote(Note note) async{
    await box.add(note);
  }

  Future<void> updateNote(int index,Note note) async{
    await box.putAt(index, note);
  }
  Future<void> deleteNote(int index) async{
    await box.deleteAt(index);
  }
}
