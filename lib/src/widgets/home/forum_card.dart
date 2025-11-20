part of '../widgets.dart';

class ForumCard extends StatelessWidget {
  final String title;
  final String? topImagePath;
  final String? centerImagePath;
  final IconData? bottomIcon;
  final String? bottomText;

  const ForumCard({
    super.key,
    this.title = "Forum Title",
    this.topImagePath,
    this.centerImagePath,
    this.bottomIcon,
    this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(110, 116, 134, 0.24),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              // IMAGE ATAS 50%
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: topImagePath != null
                      ? Image.asset(
                          topImagePath!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(color: Colors.grey[300]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // TITLE
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF24292E),
                          fontFamily: "DM Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          height: 15 / 14,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // ICON + TEXT (optional)
                      if (bottomIcon != null && bottomText != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              bottomIcon,
                              size: 16,
                              color: Color(0xFF344561),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              bottomText!,
                              style: const TextStyle(
                                color: Color(0xFF344561),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (centerImagePath != null)
            Positioned(
              top: 68,
              left: (160 - 64) / 2,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFFFFF), width: 4),
                  image: DecorationImage(
                    image: AssetImage(centerImagePath!),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey[300],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
