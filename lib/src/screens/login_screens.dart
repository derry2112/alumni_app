part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go('/home');
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GoogleButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginWithGooglePressed());
                  },
                ),
                const SizedBox(height: 16),
                if (state is LoginLoading) const CircularProgressIndicator(),
                if (state is LoginFailure) ...[
                  const SizedBox(height: 16),
                  const Icon(Icons.error, color: Colors.red),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
