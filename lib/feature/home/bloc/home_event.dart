part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


final class HomeCategoriesPressedEvent extends HomeEvent {
  final String selectedCategory;

  HomeCategoriesPressedEvent(this.selectedCategory, );

}
