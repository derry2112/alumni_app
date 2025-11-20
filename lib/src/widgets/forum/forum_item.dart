part of '../widgets.dart';

class ForumItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const ForumItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.buttonText = "More",
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 200.0;
    final double imageHeight = cardHeight * 0.7;

    return Container(
      width: double.infinity,
      height: cardHeight,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(110, 116, 134, 0.24),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: imageHeight,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -4),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF344561),
                        fontFamily: "DM Sans",
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 69,
                      height: 22,
                      child: ElevatedButton(
                        onPressed: onButtonPressed,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF344561),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Text(
                          buttonText,
                          style: const TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
