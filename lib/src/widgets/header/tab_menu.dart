part of '../widgets.dart';

class MenuTab extends StatelessWidget {
  final String title;
  final bool isActive;

  const MenuTab({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TabShadowPainter(isActive: isActive),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title.isNotEmpty) const SizedBox(width: 8),
            if (title.isNotEmpty)
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF24292E),
                  fontFamily: "DM Sans",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 24 / 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TabShadowPainter extends CustomPainter {
  final bool isActive;

  _TabShadowPainter({required this.isActive});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()..color = Colors.white;
    canvas.drawRect(rect, paint);

    if (isActive) {
      final topShadow = Paint()
        ..color = Colors.black.withOpacity(0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, 4), topShadow);
    }

    final bottomBorder = Paint()
      ..color = isActive ? const Color(0xFF344561) : const Color(0xFFDFE7EF)
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      bottomBorder,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
