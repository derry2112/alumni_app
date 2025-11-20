part of '../widgets.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final double? width;
  final EdgeInsetsGeometry padding;

  const SectionTitle({
    super.key,
    required this.text,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: width ?? 108, // default width 108, bisa di override
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF344561),
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w900,
              height: 24 / 16,
            ),
          ),
        ),
      ),
    );
  }
}
