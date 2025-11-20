part of '../bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc(this.authService) : super(LoginInitial()) {
    on<LoginWithGooglePressed>(_onLoginWithGooglePressed);
    on<LogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onLoginWithGooglePressed(
      LoginWithGooglePressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await authService.signInWithGoogle();
      if (user != null) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure(
            'Akun belum terdaftar. Silakan daftar melalui portal web.'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _onLogoutPressed(
      LogoutPressed event, Emitter<LoginState> emit) async {
    await authService.signOut();
    emit(LoginInitial());
  }
}
