import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String? time;
  final List<String> participants;
  final bool isNote;
  final Color color;

  Task({
    required this.id,
    required this.title,
    this.time,
    required this.participants,
    this.isNote = false,
    required this.color,
  });

  factory Task.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'] ?? '',
      time: data['time'],
      participants: List<String>.from(data['participants'] ?? []),
      isNote: data['isNote'] ?? false,
      color: Color(data['color'] ?? 0xFFFFD700),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'time': time,
      'participants': participants,
      'isNote': isNote,
      'color': color.value,
    };
  }
}