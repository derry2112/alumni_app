part of '../widgets.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        const SizedBox(height: 16),
        SizedBox(
          width: 343,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF344561), width: 2),
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF344561),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            icon: SizedBox(
              width: 18,
              height: 18,
              child: SvgPicture.asset(
                'assets/login/Google__G__Logo 1.svg',
                fit: BoxFit.contain,
              ),
            ),
            label: const Text(
              "Sign in with Google",
              style: TextStyle(
                fontFamily: "DM Sans",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 20 / 12,
                letterSpacing: -0.24,
                color: Color(0xFF344561),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
