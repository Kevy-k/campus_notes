import 'package:campus_notes/providers/note_provider.dart';
import 'package:campus_notes/screens/edit.dart';
import 'package:campus_notes/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campus Notes",style: TextStyle(color: Theme.of(context).colorScheme.secondary),)),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEditNoteScreen(),
              ),
            );
          },
          child: Icon(Icons.add,color: Theme.of(context).colorScheme.primary,),
        ),
      ),

      body: Consumer<NoteProvider>(
        builder: (context, notePro, child) {
          final my_note = notePro.notes;

          if (my_note.isEmpty) {
            return  Center(child: Text("No notes yet. Tap + to add one!",style: TextStyle(color: Theme.of(context).colorScheme.secondary),));
          }

          return ListView.builder(
            itemCount: my_note.length,
            itemBuilder: (context, index) {
              final noteContent=my_note[index];
              return NoteCard(
                note: noteContent,
                onDelete: () {
                  notePro.deleteNotes(index);
                },
                onEdit: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditNoteScreen(
                        note: noteContent,
                        index: index,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
