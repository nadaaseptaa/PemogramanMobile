import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key}); // FIX: tambah key

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  // Load notes
  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    String? notesString = prefs.getString('notes');

    if (notesString != null) {
      List<dynamic> notesJson = jsonDecode(notesString);
      setState(() {
        notes = notesJson.map((json) => Note.fromJson(json)).toList();
      });
    }
  }

  // Save notes
  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> notesJson = notes
        .map((note) => note.toJson())
        .toList();
    String notesString = jsonEncode(notesJson);
    await prefs.setString('notes', notesString);
  }

  // Add note
  void _addNote(String title, String content) {
    setState(() {
      notes.add(
        Note(
          id: DateTime.now().toString(),
          title: title,
          content: content,
          createdAt: DateTime.now(),
        ),
      );
    });
    _saveNotes();
  }

  // Update note
  void _updateNote(int index, String title, String content) {
    setState(() {
      notes[index].title = title;
      notes[index].content = content;
    });
    _saveNotes();
  }

  // Delete note
  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
    _saveNotes();
  }

  // Dialog
  void _showNoteDialog({int? index}) {
    final isEdit = index != null;
    final titleController = TextEditingController(
      text: isEdit ? notes[index].title : '',
    );
    final contentController = TextEditingController(
      text: isEdit ? notes[index].content : '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEdit ? 'Edit Catatan' : 'Tambah Catatan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Isi Catatan'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  contentController.text.isNotEmpty) {
                if (isEdit) {
                  _updateNote(
                    index,
                    titleController.text,
                    contentController.text,
                  );
                } else {
                  _addNote(titleController.text, contentController.text);
                }
                Navigator.pop(context);
              }
            },
            child: Text(isEdit ? 'Update' : 'Simpan'),
          ),
        ],
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pink Notes')),
      body: notes.isEmpty
          ? const Center(
              child: Text(
                'Belum ada catatan 💗',
                style: TextStyle(fontSize: 18, color: Colors.pink),
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  color: Colors.pink.shade100,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(
                      note.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade900,
                      ),
                    ),
                    subtitle: Text(note.content),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.pink.shade900),
                      onPressed: () => _deleteNote(index),
                    ),
                    onTap: () => _showNoteDialog(index: index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showNoteDialog(),
      ),
    );
  }
}
