part of '../widgets.dart';

class HumasCard extends StatelessWidget {
  final Widget child;

  const HumasCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: double.infinity,
        height: 105,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(112, 144, 176, 0.12),
              offset: Offset(0, 18),
              blurRadius: 40,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
