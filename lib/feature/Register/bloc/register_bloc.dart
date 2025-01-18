import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../util/app_constants.dart';
import '../models/program_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterInitialEvent>(registerInitialEvent);
    on<RegisterButtonPressedEvent>(registerButtonPressedEvent);
  }

  FutureOr<void> registerInitialEvent(
      RegisterInitialEvent event, Emitter<RegisterState> emit) async {
    // emit(RegisterInitialState());
    final url = Uri.parse('${AppContstants.baseUrl}/api/programs');

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
      print('the error is loading programs first $e');
    }
  }

  FutureOr<void> registerButtonPressedEvent(
      RegisterButtonPressedEvent event, Emitter<RegisterState> emit) async {
    final url = Uri.parse('http://192.168.1.5:8000/api/register');

    try {
      final response = await http.post(url, body: {
        "name": event.firstName,
        "university": event.university,
        "program": event.program,
        "email": event.email,
        "password": event.password,
        "password_confirmation": event.passwordConfirmation,
      });
      final result = jsonDecode(response.body);
      // print()

      if (result['success'] == true) {
        emit(RegisterSuccessState());
      } else {
          

        try {
          final urlP = Uri.parse('${AppContstants.baseUrl}/api/programs');
          final response = await http.get(urlP);
          final resultData = jsonDecode(response.body);
          List<Program> programs = [];

          for (int i = 0; i < resultData.length; i++) {
            Program program = Program.fromJson(resultData[i]);

            programs.add(program);
          }

          emit(RegisterProgramsLoadingState(
              programs: programs, currentProgram: 0));

           emit(RegisterErrorState(
              errors: result, programs: programs, currentProgram: 0));
        } catch (e) {
          print('the error is loading programs $e');
        }
       
      }
    } catch (e) {
      print('the error is for pressing the register button $e');
    }
  }
}
