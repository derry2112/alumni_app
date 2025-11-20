part of '../widgets.dart';

class BannerHeaderWidget extends StatelessWidget {
  final String firstName;

  const BannerHeaderWidget({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              'assets/home/maskgroup.png',
              width: double.infinity,
              height: 140,
              fit: BoxFit.contain,
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Hi, $firstName \n",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(blurRadius: 4, color: Colors.black54),
                        ],
                      ),
                    ),
                    const TextSpan(
                      text: "Selamat datang kembali",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        shadows: [
                          Shadow(blurRadius: 4, color: Colors.black54),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
