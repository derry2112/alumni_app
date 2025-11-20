part of '../widgets.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FlutterLogo(size: 100),
        SizedBox(height: 16),
        Text(
          "Welcome to Alumni App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
