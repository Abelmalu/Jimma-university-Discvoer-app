part of 'internship_bloc.dart';

@immutable
sealed class InternshipEvent {}


final class InternshipInitialEvent extends InternshipEvent{}
final class InternshipNavigateToLoginEvent extends InternshipEvent{}




