part of 'utilities.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // ONBOARDING
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // AUTH
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // MAIN CONTAINER - BOTTOM NAVIGATION
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainContainer(),
    ),

    // HOME (Dipanggil dari MainContainer)
    GoRoute(
      path: '/main',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
