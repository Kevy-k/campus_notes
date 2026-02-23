import 'package:flutter/material.dart';
import 'package:campus_notes/models/note_model.dart';
import 'package:campus_notes/services/hive_service.dart';


class NoteProvider extends ChangeNotifier{
 final HiveService _hiveService=HiveService();
 List<Note> _notes=[];
 List<Note> get notes=>_notes;

 void loadNotes()
  {
    _notes=_hiveService.getNotes();
    notifyListeners();
  }

  Future<void> addNotes(Note note)async{
    await _hiveService.addNote(note);
    loadNotes();
  }

  Future<void> updateNotes(int index,Note note)async{
    await _hiveService.updateNote(index, note);
    loadNotes();
  }

  Future<void> deleteNotes(int index)async{
    await _hiveService.deleteNote(index);
    loadNotes();
  }
}