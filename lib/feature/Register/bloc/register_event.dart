part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class RegisterInitialEvent extends RegisterEvent {
  final int currentProgram;
  RegisterInitialEvent({required this.currentProgram});
}

final class RegisterButtonPressedEvent extends RegisterEvent {
  final String firstName;
  final String university;
  final String program;
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterButtonPressedEvent({required this.firstName, required this.university, required this.program, required this.email, required this.password, required this.passwordConfirmation});

}
