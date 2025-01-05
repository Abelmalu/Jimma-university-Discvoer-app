part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginButtonPressedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressedEvent({required this.username, required this.password});
}
