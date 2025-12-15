import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveNotes(List<Note> notes) async {
    final data = notes.map((note) => jsonEncode(note.toMap())).toList();
    await _prefs.setStringList('notes', data);
  }

  static List<Note> loadNotes() {
    final data = _prefs.getStringList('notes') ?? [];
    return data
        .map((e) => Note.fromMap(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }
}
