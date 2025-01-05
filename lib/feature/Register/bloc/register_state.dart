part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}






 class RegisterProgramsLoadingState extends RegisterState {
  final List<Program> programs;
   final int currentProgram;

  RegisterProgramsLoadingState({required this.programs, required this.currentProgram});
}
