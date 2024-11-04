import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/role_selector.dart';
import '../widgets/task_grid.dart';
import '../widgets/reminder_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 24),
              const Text(
                'Daily Work\nPriorities',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 24),
              const RoleSelector(),
              const SizedBox(height: 16),
              const TaskGrid(),
              const SizedBox(height: 16),
              const ReminderCard(),
            ],
          ),
        ),
      ),
    );
  }
}