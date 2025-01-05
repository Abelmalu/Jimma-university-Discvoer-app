import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/internship_model.dart';
import 'internship_state.dart';

part 'internship_event.dart';

class InternshipBloc extends Bloc<InternshipEvent, InternshipState> {
  InternshipBloc() : super(InternshipInitialState()) {
    on<InternshipInitialEvent>(internshipInitialEvent);
    on<InternshipNavigateToLoginEvent>(internshipNavigateToLoginEvent);
  }

  FutureOr<void> internshipInitialEvent(
      InternshipInitialEvent event, Emitter<InternshipState> emit) async {
    emit(InternshipInitialState());

    try {
      final response =
          await http.get(Uri.parse('http://localhost:8000/api/internship'));

      // print(response.body);

      final result = jsonDecode(response.body);
      print(result);
      // print(result);
      List<Internship> fetchedInternships = [];
      for (int i = 0; i < result.length; i++) {
        Internship internship = Internship.fromJson(result[i]);
        fetchedInternships.add(internship);
      }

      emit(InternshipLoadingSuccessState(internships: fetchedInternships));
    } catch (e) {
      print('the error is $e');
    }
  }

  FutureOr<void> internshipNavigateToLoginEvent(
      InternshipNavigateToLoginEvent event, Emitter<InternshipState> emit) {
    emit(InternshipNavigateToLoginScreenState());
  }
}
