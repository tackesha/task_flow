import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.settings, size: 24),
            const SizedBox(width: 8),
            Text(
              'Task Flow',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://placekitten.com/100/100', // Replace with actual avatar image
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.notifications_none, size: 24),
          ],
        ),
      ],
    );
  }
}