import 'package:campus_notes/models/note_model.dart';
import 'package:campus_notes/providers/note_provider.dart';
import 'package:campus_notes/screens/theme.dart';
import 'package:campus_notes/screens/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(
    ChangeNotifierProvider(
    create: (context) => NoteProvider()..loadNotes(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campus Notes',
        theme: lightMode,
        darkTheme: darkMode,
        home: const UserLogin()
      ),
    );
  }
}

