import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import '../../main.dart';
import 'widgets/note_item_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final quickActions = const QuickActions();
  bool loading = false;
  List<String> notes = [];

  void addNote(String note) {
    if (notes.any((e) => e.toLowerCase() == note.toLowerCase())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Esta nota já existe'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() => notes.add(note));
    }
  }

  void removeNote(String note) => setState(() => notes.remove(note));

  Future<void> fetch() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(seconds: 1));

    setState(() => notes = []);

    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      quickActions.setShortcutItems([
        const ShortcutItem(
          type: 'note',
          localizedTitle: 'Nova nota',
          icon: 'ic_add.png',
        ),
      ]);
      quickActions.initialize((type) async {
        if (type == 'note') {
          var note = await Navigator.pushNamed(context, AppRoutes.NEW_NOTES);

          if (note != null) {
            addNote(note as String);
          }
        }
      });
    }
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var note = await Navigator.pushNamed(context, AppRoutes.NEW_NOTES);

          if (note != null) {
            addNote(note as String);
          }
        },
      ),
      body: loading == true
          ? const Center(child: CircularProgressIndicator())
          : notes.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhuma nota encontrada.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: notes.length,
                  padding: const EdgeInsets.all(20),
                  separatorBuilder: (context, index) => const Divider(height: 24),
                  itemBuilder: (context, index) => NoteItemWidget(
                    notes[index],
                    onDelete: (note) => removeNote(note),
                  ),
                ),
    );
  }
}
