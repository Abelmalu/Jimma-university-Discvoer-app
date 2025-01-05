import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/program_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterInitialEvent>(registerInitialEvent);
  }

  FutureOr<void> registerInitialEvent(
      RegisterInitialEvent event, Emitter<RegisterState> emit) async {
    final url = Uri.parse('http://localhost:8000/api/programs');

    try {
      final response = await http.get(url);
      final result = jsonDecode(response.body);
      List<Program> programs = [];

      for (int i = 0; i < result.length; i++) {
        Program program = Program.fromJson(result[i]);
        
        programs.add(program);
      }
    

      emit(RegisterProgramsLoadingState(
          programs: programs, currentProgram: event.currentProgram));

    } catch (e) {
      print('the error is $e');
    }
  }
}
