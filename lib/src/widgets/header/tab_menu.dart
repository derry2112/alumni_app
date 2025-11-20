part of '../widgets.dart';

class MenuTab extends StatelessWidget {
  final String title;
  // final String imagePath;
  final bool isActive;

  const MenuTab({
    super.key,
    required this.title,
    // required this.imagePath,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 189,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: isActive ? const Color(0xFF344561) : Colors.transparent,
            width: 2,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, -4), // shadow mengarah ke bawah
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}

class _InsetShadowPainter extends CustomPainter {
  final bool isActive;

  _InsetShadowPainter(this.isActive);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    canvas.saveLayer(rect, Paint());

    canvas.drawRect(rect,
        Paint()..color = isActive ? const Color(0xFF344561) : Colors.white);

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawRect(rect, shadowPaint);

    final clearPaint = Paint()..blendMode = BlendMode.clear;
    canvas.drawRect(rect.deflate(4), clearPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
