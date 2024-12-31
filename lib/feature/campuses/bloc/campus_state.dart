import '../../../data/models/campus_model.dart';

sealed class CampusState {}

final class CampusInitialState extends CampusState {}

final class CampusLoadingSuccsessState extends CampusState {
 final List<Campus> campuses;

  CampusLoadingSuccsessState({required this.campuses});
}

final class CampusLoadingFailureState extends CampusState {}
