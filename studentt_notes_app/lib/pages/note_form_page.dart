import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteFormPage extends StatefulWidget {
  const NoteFormPage({super.key});

  @override
  State<NoteFormPage> createState() => _NoteFormPageState();
}

class _NoteFormPageState extends State<NoteFormPage> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController contentCtrl = TextEditingController();

  NoteCategory category = NoteCategory.kuliah;

  void _save() {
    if (titleCtrl.text.isEmpty || contentCtrl.text.isEmpty) return;

    Navigator.pop(
      context,
      Note(
        title: titleCtrl.text,
        content: contentCtrl.text,
        createdAt: DateTime.now(),
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<NoteCategory>(
              value: category,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              items: NoteCategory.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                  .toList(),
              onChanged: (v) => setState(() => category = v!),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: contentCtrl,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Isi Catatan',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    contentCtrl.dispose();
    super.dispose();
  }
}
