import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:campus_notes/models/note_model.dart';
import 'package:campus_notes/providers/note_provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  // If these are null, we are ADDING. If they have data, we are EDITING.
  final Note? note;
  final int? index;

  const AddEditNoteScreen({super.key, this.note, this.index});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the text fields with existing data if we are editing
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _subjectController.text = widget.note!.subject;
      _descriptionController.text = widget.note!.description;
    }
  }

  @override
  void dispose() {
    // Always dispose controllers to prevent memory leaks
    _titleController.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveNote() {
    // 1. Prevent saving if core fields are empty
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title and Description cannot be empty!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 2. Create the new note object
    final newNote = Note(
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim().isEmpty
          ? "General"
          : _subjectController.text.trim(),
      description: _descriptionController.text.trim(),
      // If editing, keep the old date. If adding, stamp the current time.
      created_at: widget.note != null
          ? widget.note!.created_at
          : DateTime.now().toString(),
    );

    final provider = Provider.of<NoteProvider>(context, listen: false);

    // 3. Check if we are updating or adding
    if (widget.index != null) {
      provider.updateNotes(widget.index!, newNote);
    } else {
      provider.addNotes(newNote);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          widget.note == null ? "Add Note" : "Edit Note",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        toolbarHeight: 50.h,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: _saveNote,
              child: Icon(
                Icons.save,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      // SingleChildScrollView prevents the keyboard from causing an overflow error
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                style: TextStyle(
                  
                  fontSize: 26.sp, // Large font for the title
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.5),
                  ),
                  border: InputBorder.none, // Removes the box entirely
                  contentPadding:
                      EdgeInsets.zero, // Aligns text perfectly to the edge
                ),
              ),

              SizedBox(height: 15.h),

              TextField(
                controller: _subjectController,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization
                    .words, // Capitalizes each word for a subject
                decoration: InputDecoration(
                  hintText: "Subject (e.g. Math)",
                  hintStyle: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.subject,
                    size: 20.sp,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.7),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 30.w,
                  ), // Keeps the icon close to the text
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),

              Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                height: 30.h,
              ),

              SizedBox(height: 15.h),

              TextField(
                controller: _descriptionController,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.5, 
                  color: Theme.of(context).colorScheme.secondary,
                ),
                keyboardType: TextInputType
                    .multiline, // Gives them a "Return" key instead of "Done"
                maxLines: null, // Allows the text field to grow infinitely!
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Start typing...",
                  hintStyle: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
