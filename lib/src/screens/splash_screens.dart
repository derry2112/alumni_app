part of 'screens.dart';

// ========================= SPLASH SCREEN =========================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final seenOnboarding = await OnboardingService.hasSeenOnboarding();
    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    if (!seenOnboarding) {
      context.go('/onboarding');
      return;
    }

    context.go(user != null ? '/main' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icon/Layer_1.svg', width: 90, height: 90),
            const SizedBox(height: 20),
            const Text(
              'Alumni Connect',
              style: TextStyle(
                color: Color(0xFF344561),
                fontFamily: 'DM Sans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Penaburs Alumni Application',
              style: TextStyle(
                color: Color(0xFF344561),
                fontSize: 13,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Color(0xFF344561),
              strokeWidth: 2.2,
            ),
          ],
        ),
      ),
    );
  }
}

// // ========================= STAY SCREEN =========================
// class StayScreen extends StatelessWidget {
//   const StayScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Text(
//               'Stay Updated with Official News',
//               style: TextStyle(
//                 fontFamily: 'DM Sans',
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF344561),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 14),

//             const Text(
//               'Get the latest updates from the school’s Public Relations team — from campus events to alumni activities and official announcements. Stay connected, wherever you are.',
//               style: TextStyle(
//                 fontFamily: 'DM Sans',
//                 fontSize: 13,
//                 color: Color(0xFF344561),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 40),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                   label: 'Skip',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: const Color(0xFF040D12),
//                   textColor: Colors.white,
//                   onPressed: () async {
//                     await OnboardingService.setOnboardingSeen();
//                     context.go('/login');
//                   },
//                 ),

//                 CustomButton(
//                   label: 'Next',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: Colors.white,
//                   textColor: const Color(0xFF344561),
//                   border: const BorderSide(
//                     color: Color(0xFF344561),
//                     width: 2,
//                   ),
//                   onPressed: () => context.go('/connect'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ========================= CONNECT SCREEN =========================
// class ConnectScreen extends StatelessWidget {
//   const ConnectScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Text(
//               'Connect Alumni',
//               style: TextStyle(
//                 fontFamily: 'DM Sans',
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF344561),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 14),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                   label: 'Skip',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: const Color(0xFF040D12),
//                   textColor: Colors.white,
//                   onPressed: () async {
//                     await OnboardingService.setOnboardingSeen();
//                     context.go('/login');
//                   },
//                 ),

//                 CustomButton(
//                   label: 'Next',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: Colors.white,
//                   textColor: const Color(0xFF344561),
//                   border: const BorderSide(
//                     color: Color(0xFF344561),
//                     width: 2,
//                   ),
//                   onPressed: () => context.go('/share'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ========================= SHARE SCREEN =========================
// class ShareScreen extends StatelessWidget {
//   const ShareScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Text(
//               'Share Moments',
//               style: TextStyle(
//                 fontFamily: 'DM Sans',
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF344561),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 14),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomButton(
//                   label: 'Skip',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: const Color(0xFF040D12),
//                   textColor: Colors.white,
//                   onPressed: () async {
//                     await OnboardingService.setOnboardingSeen();
//                     context.go('/login');
//                   },
//                 ),

//                 CustomButton(
//                   label: 'Next',
//                   width: 169,
//                   height: 52,
//                   backgroundColor: Colors.white,
//                   textColor: const Color(0xFF344561),
//                   border: const BorderSide(
//                     color: Color(0xFF344561),
//                     width: 2,
//                   ),
//                   onPressed: () async {
//                     await OnboardingService.setOnboardingSeen();
//                     context.go('/login');
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
