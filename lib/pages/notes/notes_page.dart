import 'package:flutter/material.dart';
import 'widgets/note_item_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool loading = false;
  List<String> notes = [];

  void addNote(String note) => setState(() => notes.add(note));
  void removeNote(String note) => setState(() => notes.remove(note));

  Future<void> fetch() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      notes = [
        'Fazer dever de casa',
        'Aprender Flutter',
      ];
    });

    setState(() => loading = false);
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloco de Notas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
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
