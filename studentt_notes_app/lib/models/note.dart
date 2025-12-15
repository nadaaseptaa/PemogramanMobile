enum NoteCategory { kuliah, organisasi, pribadi, lainnya }

class Note {
  String title;
  String content;
  DateTime createdAt;
  NoteCategory category;

  Note({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.category,
  });

  Map<String, dynamic> toMap() => {
    'title': title,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
    'category': category.index,
  };

  factory Note.fromMap(Map<String, dynamic> map) => Note(
    title: map['title'] as String,
    content: map['content'] as String,
    createdAt: DateTime.parse(map['createdAt'] as String),
    category: NoteCategory.values[map['category'] as int],
  );
}
