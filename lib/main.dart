import 'package:flutter/material.dart';
import 'pages/new_note/new_note_page.dart';
import 'pages/notes/notes_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shortcuts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primaryColorDark: Colors.deepPurple.shade700,
        primaryColorLight: Colors.deepPurple.shade200,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 70,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.deepPurple,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.NOTES,
      routes: {
        AppRoutes.NOTES: (context) => const NotesPage(),
        AppRoutes.NEW_NOTES: (context) => NewNotePage(),
      },
    );
  }
}

class AppRoutes {
  static const String NOTES = '/notes';
  static const String NEW_NOTES = '$NOTES/new';
}