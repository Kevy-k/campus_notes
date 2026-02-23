import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject{
 
 @HiveField(0)
 String title;
 @HiveField(1)
 String description;
 @HiveField(2)
 String subject;
 @HiveField(3)
 String created_at;

 Note({
  required this.title,
  required this.description,
  required this.subject,
  required this.created_at});

}

