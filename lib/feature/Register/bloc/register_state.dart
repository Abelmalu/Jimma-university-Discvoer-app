part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

class RegisterProgramsLoadingState extends RegisterState {
  final List<Program> programs;
  final int currentProgram;

  RegisterProgramsLoadingState(
      {required this.programs, required this.currentProgram});
}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
    final List<Program> programs;
  final int currentProgram;
  final Map errors;

  RegisterErrorState({required this.programs, required this.currentProgram, required this.errors});

}
