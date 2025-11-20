part of '../widgets.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await AuthService().signOut();
      },
      child: const Text('Logout'),
    );
  }
}
