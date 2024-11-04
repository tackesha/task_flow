import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reminder_provider.dart';

class ReminderCard extends ConsumerWidget {
  const ReminderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsyncValue = ref.watch(reminderNotifierProvider);

    return remindersAsyncValue.when(
      data: (reminders) {
        if (reminders.isEmpty) {
          return const SizedBox.shrink();
        }

        final currentReminder = reminders.first;
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Reminder',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left, color: Colors.deepPurple),
                        onPressed: () {
                          // Handle previous reminder
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right, color: Colors.deepPurple),
                        onPressed: () {
                          // Handle next reminder
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                currentReminder.text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${currentReminder.index} of ${currentReminder.total}',
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}