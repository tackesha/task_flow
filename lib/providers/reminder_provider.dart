import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/reminder.dart';

part 'reminder_provider.g.dart';

@riverpod
class ReminderNotifier extends _$ReminderNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Reminder>> build() {
    return _firestore
        .collection('reminders')
        .orderBy('index')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Reminder.fromFirestore(doc)).toList());
  }

  Future<void> addReminder(Reminder reminder) async {
    await _firestore.collection('reminders').add(reminder.toFirestore());
  }

  Future<void> updateReminder(Reminder reminder) async {
    await _firestore.collection('reminders').doc(reminder.id).update(reminder.toFirestore());
  }

  Future<void> deleteReminder(String reminderId) async {
    await _firestore.collection('reminders').doc(reminderId).delete();
  }
}