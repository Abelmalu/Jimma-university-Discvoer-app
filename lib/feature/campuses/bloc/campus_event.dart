import '../../../data/models/campus_model.dart';

sealed class CampusEvent {}

final class CampusInitialEvent extends CampusEvent {}

final class CampusItemPressedEvent extends CampusEvent {
  final String selectedCampus;

  CampusItemPressedEvent({required this.selectedCampus});

}
