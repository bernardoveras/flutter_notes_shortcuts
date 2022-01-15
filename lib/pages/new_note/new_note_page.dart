import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  String note = '';

  void save() {
    if (note.isEmpty) return;

    Navigator.pop(context, note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: note.isEmpty ? null : save,
          ),
        ],
        title: const Text(
          'Nova nota',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Descrição da nota',
              ),
              onChanged: (v) => setState(() => note = v),
              onSubmitted: (v) => save(),
            ),
          ],
        ),
      ),
    );
  }
}
