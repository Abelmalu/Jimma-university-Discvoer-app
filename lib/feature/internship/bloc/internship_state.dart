import '../models/internship_model.dart';

sealed class InternshipState {}

final class InternshipInitialState extends InternshipState {}
final class InternshipActionState extends InternshipState{}

final class InternshipLoadingSuccessState extends InternshipState {
  final List<Internship> internships;

  InternshipLoadingSuccessState({required this.internships});
}

final class InternshipLoadingFailureState extends InternshipState {}

final class InternshipNavigateToLoginScreenState extends InternshipActionState {
  final int internshipId;

  InternshipNavigateToLoginScreenState({required this.internshipId});
}

final class InternshipDetailLoadedSuccessState extends InternshipState {
  final Internship internship;

  InternshipDetailLoadedSuccessState({required this.internship});
}

