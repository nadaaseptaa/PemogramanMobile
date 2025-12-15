import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/storage_service.dart';
import 'note_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    notes = StorageService.loadNotes();
  }

  Color _categoryColor(NoteCategory c) {
    switch (c) {
      case NoteCategory.kuliah:
        return Colors.indigo;
      case NoteCategory.organisasi:
        return Colors.green;
      case NoteCategory.pribadi:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _categoryIcon(NoteCategory c) {
    switch (c) {
      case NoteCategory.kuliah:
        return Icons.school;
      case NoteCategory.organisasi:
        return Icons.groups;
      case NoteCategory.pribadi:
        return Icons.person;
      default:
        return Icons.note;
    }
  }

  Future<void> _addNote() async {
    final result = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => const NoteFormPage()),
    );

    if (result != null) {
      setState(() => notes.add(result));
      StorageService.saveNotes(notes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Notes')),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                'Belum ada catatan\nTekan + untuk menambah',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (context, i) {
                final n = notes[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _categoryColor(n.category),
                      child: Icon(
                        _categoryIcon(n.category),
                        color: Colors.white,
                      ),
                    ),
                    title: Text(n.title),
                    subtitle: Text(
                      n.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() => notes.removeAt(i));
                        StorageService.saveNotes(notes);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
