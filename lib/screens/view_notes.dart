import 'package:campus_notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ViewNotes extends StatelessWidget {
  final Note note;
  const ViewNotes({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    DateTime parsed_date = DateTime.parse(note.created_at);
    String formattedDate = DateFormat(
      'MMM dd, yyyy - hh:mm a',
    ).format(parsed_date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note.title,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              formattedDate,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.subject,
                      size: 16.sp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      note.subject,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              SelectableText(
                note.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.6,
                  letterSpacing: 0.3,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
