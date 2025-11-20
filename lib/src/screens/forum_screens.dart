part of 'screens.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                onLogout: () => context.read<LoginBloc>().add(LogoutPressed()),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  MenuHeader(
                    title: "",
                    imagePath: "assets/menu/Icon - Menu.png",
                  ),
                  MenuHeader(
                    title: "News",
                    imagePath: "assets/menu/Layer_1.png",
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: MenuTab(
                      title: "Discover Forums",
                      isActive: true,
                    ),
                  ),
                  Expanded(
                    child: MenuTab(
                      title: "Joined Forums",
                      isActive: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
                const SizedBox(height: 8),
                EventCardCarousel(controller: _pageController),
                const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
