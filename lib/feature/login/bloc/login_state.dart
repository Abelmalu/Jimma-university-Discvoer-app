part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccssState extends LoginState{}
final class LoginFailState extends LoginState{}
final class RegisterTextButtonPressedState  extends LoginState{}