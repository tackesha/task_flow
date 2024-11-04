import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  final String id;
  final String text;
  final int index;
  final int total;

  Reminder({
    required this.id,
    required this.text,
    required this.index,
    required this.total,
  });

  factory Reminder.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Reminder(
      id: doc.id,
      text: data['text'] ?? '',
      index: data['index'] ?? 1,
      total: data['total'] ?? 1,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'index': index,
      'total': total,
    };
  }
}