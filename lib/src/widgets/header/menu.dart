part of '../widgets.dart';

class MenuHeader extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? trailingImagePath;

  const MenuHeader({
    super.key,
    required this.title,
    required this.imagePath,
    this.trailingImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final bool noTitle = title.trim().isEmpty;

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: noTitle ? 0 : 16,
        top: 11,
        bottom: 11,
      ),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 26,
            height: 24,
          ),
          if (!noTitle) ...[
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF24292E), // var(--mono-mono100)
                fontFamily: "DM Sans",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 24 / 16, // line-height: 24px (150%)
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
          if (trailingImagePath != null) ...[
            const SizedBox(width: 8),
            Image.asset(
              trailingImagePath!,
              width: 26,
              height: 24,
            ),
          ],
        ],
      ),
    );
  }
}
