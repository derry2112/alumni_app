part of '../widgets.dart';

class LoadMoreDivider extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double lineWidth;
  final Color color;

  const LoadMoreDivider({
    super.key,
    required this.onTap,
    this.text = 'Load More',
    this.lineWidth = 140,
    this.color = const Color(0xFF344561),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: lineWidth, height: 1, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'DM Sans',
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          Container(width: lineWidth, height: 1, color: color),
        ],
      ),
    );
  }
}
