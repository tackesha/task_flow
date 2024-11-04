import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'role_provider.g.dart';

@riverpod
class RoleNotifier extends _$RoleNotifier {
  @override
  String build() {
    return 'UI/UX Designer'; // Default role
  }

  void updateRole(String newRole) {
    state = newRole;
  }
}