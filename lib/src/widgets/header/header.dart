part of '../widgets.dart';

class Header extends StatelessWidget {
  final VoidCallback onLogout;
  final String imagePath;
  final String iconPath;

  const Header({
    super.key,
    required this.onLogout,
    this.imagePath = 'assets/home/Ellipse 9.png',
    this.iconPath = 'assets/home/Vector.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(43, 18, 43, 9),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Spacer(),
          GestureDetector(
            onTap: onLogout,
            child: SvgPicture.asset(iconPath, width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}
