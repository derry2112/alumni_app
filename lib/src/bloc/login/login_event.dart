part of '../bloc.dart';

abstract class LoginEvent {}

class LoginWithGooglePressed extends LoginEvent {}

class LogoutPressed extends LoginEvent {}
