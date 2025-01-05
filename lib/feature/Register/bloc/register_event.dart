part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class RegisterInitialEvent extends RegisterEvent {
  final int currentProgram;
  RegisterInitialEvent({required this.currentProgram});
}
