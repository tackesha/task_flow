import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class TaskGrid extends ConsumerWidget {
  const TaskGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsyncValue = ref.watch(taskNotifierProvider);

    return tasksAsyncValue.when(
      data: (tasks) => GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: tasks.map((task) => _buildTaskCard(task)).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildTaskCard(Task task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: task.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: task.color,
            ),
          ),
          if (task.time != null) ...[
            const Spacer(),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: task.color),
                const SizedBox(width: 4),
                Text(
                  task.time!,
                  style: TextStyle(
                    fontSize: 12,
                    color: task.color,
                  ),
                ),
              ],
            ),
          ],
          if (task.participants.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                for (int i = 0; i < task.participants.length.clamp(0, 3); i++)
                  Padding(
                    padding: EdgeInsets.only(left: i * -8.0),
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage('https://placekitten.com/100/100'),
                    ),
                  ),
                if (task.participants.length > 3) ...[
                  const SizedBox(width: 8),
                  Text(
                    '+${task.participants.length - 3}',
                    style: TextStyle(
                      color: task.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}