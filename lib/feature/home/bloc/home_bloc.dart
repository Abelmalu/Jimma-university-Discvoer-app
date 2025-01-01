import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCategoriesPressedEvent>(homeCategoriesPressedEvent);
  }

  FutureOr<void> homeCategoriesPressedEvent(
      HomeCategoriesPressedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCategoriesDetailScreenState(
        selectedCategory: event.selectedCategory));
  }
}
