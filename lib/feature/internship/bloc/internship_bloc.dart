import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ju_discover/util/app_constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
      final response = await http.get(Uri.parse('${AppContstants.baseUrl}/${AppContstants.getInternship}'));

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
        '${AppContstants.baseUrl}/api/internship/data/${event.internshipId}');
    final prefs = await SharedPreferences.getInstance();

// Save the counter value to persistent storage under the 'counter' key.
    final token = prefs.getString('token') ?? 0;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Include the token in the header
        },
      );
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
