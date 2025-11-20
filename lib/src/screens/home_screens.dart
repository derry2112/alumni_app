part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;

    String name = "";
    if (loginState is LoginSuccess) {
      name = loginState.user.displayName ?? "";
    }
    final firstName = name.isNotEmpty ? name.split(" ").first : "";

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitial) {
          context.go('/login');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  onLogout: () =>
                      context.read<LoginBloc>().add(LogoutPressed()),
                ),
                const SizedBox(height: 26.97),
                BannerHeaderWidget(firstName: firstName),
                const SizedBox(height: 8),
                const SectionTitle(text: "Featured"),
                const SizedBox(height: 8),
                EventCardCarousel(controller: _pageController),
                const SizedBox(height: 18),
                const SectionTitle(text: "Forum"),
                const SizedBox(height: 8),
                ForumCardCarousel(),
                const SizedBox(height: 8),
                const SectionTitle(text: "Human News"),
                const SizedBox(height: 8),
                const HumasCardCarousel(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
