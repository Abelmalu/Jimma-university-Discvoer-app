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
    on<InternshipDetailInitialEvent>(internshipDetailInitialEvent);
  }

  FutureOr<void> internshipInitialEvent(
      InternshipInitialEvent event, Emitter<InternshipState> emit) async {
    emit(InternshipInitialState());

    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.5:8000/api/internship/data'));

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
    emit(
        InternshipNavigateToLoginScreenState(internshipId: event.internshipId));
  }

  FutureOr<void> internshipDetailInitialEvent(
      InternshipDetailInitialEvent event, Emitter<InternshipState> emit) async {
    print(event.internshipId);
    final url = Uri.parse(
        'http://192.168.1.5:8000/api/internship/data/${event.internshipId}');
    try {
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      print(result);

      Internship internship = Internship.fromJson(result);
      print(internship.title);
      emit(InternshipDetailLoadedSuccessState(internship: internship));
    } catch (e) {
      print('the error is during loading internship detail $e');
    }
  }
}
