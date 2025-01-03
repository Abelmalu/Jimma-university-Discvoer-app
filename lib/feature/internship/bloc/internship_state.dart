
import '../models/internship_model.dart';



sealed class InternshipState {}

final class InternshipInitialState extends InternshipState {}

final class InternshipLoadingSuccessState extends InternshipState {
  final List<Internship> internships;

  InternshipLoadingSuccessState({ required this.internships});
}

final class InternshipLoadingFailureState extends InternshipState {}
