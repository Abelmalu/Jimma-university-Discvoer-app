import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/data/dummy_data.dart';
import 'campus_event.dart';
import 'campus_state.dart';

class CampusBloc extends Bloc<CampusEvent, CampusState> {
  CampusBloc() : super(CampusInitialState()) {
    on<CampusInitialEvent>(campusInitialEvent);
    on<CampusItemPressedEvent>(campusItemPressedEvent);
  }

  FutureOr<void> campusInitialEvent(
      CampusInitialEvent event, Emitter<CampusState> emit) async {
    emit(CampusInitialState());
    await Future.delayed(Duration(seconds: 2));
    emit(CampusLoadingSuccsessState(campuses: CAMPUSES));
  }

  FutureOr<void> campusItemPressedEvent(
      CampusItemPressedEvent event, Emitter<CampusState> emit) {
    emit(CampusNavigateToCampusDetailState(
        selectedCampus: event.selectedCampus));
  }
}
