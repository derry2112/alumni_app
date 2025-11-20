part of '../widgets.dart';

class OnboardPage extends StatelessWidget {
  final String title;
  final String subtitle;

  const OnboardPage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF344561),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 14,
            color: Color(0xFF344561),
          ),
        ),
      ],
    );
  }
}
