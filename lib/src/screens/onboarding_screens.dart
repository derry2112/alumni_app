part of 'screens.dart';

class OnboardPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const OnboardPage({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // penting
      children: [
        // gambar di atas
        Expanded(
          child: Center(
            child: Image.asset(imageAsset, fit: BoxFit.contain, height: 250),
          ),
        ),

        // Title
        SizedBox(
          width: 323,
          height: 68,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF040D12),
              fontFamily: 'DM Sans',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 26 / 32,
              letterSpacing: -0.362,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        SizedBox(
          width: 310,
          height: 80,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              color: Color(0xFF040D12),
              fontFamily: 'DM Sans',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.0,
              letterSpacing: -0.362,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int index = 0;

  final List<Map<String, String>> slides = const [
    {
      "title": "Stay Updated with Official News",
      "subtitle":
          "Get the latest updates from the school’s Public Relations team — from campus events to alumni activities and official announcements. Stay connected, wherever you are.",
      "image": "assets/images/onboard1.png",
    },
    {
      "title": "Connect and Reunite with Fellow Alumni",
      "subtitle":
          "Join your alumni community forum to share stories, discuss ideas, and reconnect with old friends. From memories to new opportunities — all in one place.",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "Share Your Stories and Inspirations",
      "subtitle":
          "Create posts, share photos, and let everyone know what’s new with your batch. Your voice matters — keep the community alive with your stories.",
      "image": "assets/images/onboard3.png",
    },
  ];

  void next() {
    if (index < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      finish();
    }
  }

  Future<void> finish() async {
    await OnboardingService.setOnboardingSeen();
    if (!mounted) return;
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => index = i),
                itemBuilder: (context, i) {
                  return OnboardPage(
                    imageAsset: slides[i]["image"]!,
                    title: slides[i]["title"]!,
                    subtitle: slides[i]["subtitle"]!,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == i ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == i
                        ? const Color(0xFF344561)
                        : const Color(0xFF344561).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  label: "Skip",
                  width: 169,
                  height: 52,
                  backgroundColor: const Color(0xFF040D12),
                  textColor: Colors.white,
                  onPressed: finish,
                ),
                CustomButton(
                  label: index == slides.length - 1 ? "Finish" : "Next",
                  width: 169,
                  height: 52,
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF344561),
                  border: const BorderSide(color: Color(0xFF344561), width: 2),
                  onPressed: next,
                ),
              ],
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
