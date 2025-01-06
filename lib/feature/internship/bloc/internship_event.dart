part of 'internship_bloc.dart';

@immutable
sealed class InternshipEvent {}

final class InternshipInitialEvent extends InternshipEvent {}

final class InternshipNavigateToLoginEvent extends InternshipEvent {
  final int internshipId;

  InternshipNavigateToLoginEvent({required this.internshipId});
}

final class InternshipDetailInitialEvent extends InternshipEvent{
  final int internshipId;

  InternshipDetailInitialEvent({required this.internshipId});


}