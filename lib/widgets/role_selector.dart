import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/role_provider.dart';

class RoleSelector extends ConsumerStatefulWidget {
  const RoleSelector({super.key});

  @override
  ConsumerState<RoleSelector> createState() => _RoleSelectorState();
}

class _RoleSelectorState extends ConsumerState<RoleSelector> {
  final List<String> roles = [
    'UI/UX Designer',
    'Frontend Developer',
    'Backend Developer',
    'Product Manager',
    'Project Manager',
    'DevOps Engineer',
    'QA Engineer',
    'Data Scientist',
    'Technical Writer',
  ];

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showRoleMenu() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 50),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: roles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    title: Text(
                      roles[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      ref.read(roleNotifierProvider.notifier).updateRole(roles[index]);
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRole = ref.watch(roleNotifierProvider);

    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: _showRoleMenu,
              child: Row(
                children: [
                  Text(
                    currentRole,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              height: 24,
              width: 1,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 16),
            const Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}