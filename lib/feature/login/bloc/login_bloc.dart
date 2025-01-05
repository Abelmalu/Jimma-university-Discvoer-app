import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
  }

  FutureOr<void> loginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    try {
      final url = Uri.parse('http://localhost:8000/api/login');
      final response = await http.post(url,
          body: {"email": event.username, "password": event.password});

      print(response.body);
      if (response.statusCode == 200) {
        print('hellow world');
      }
    } catch (e) {
      print('the error is $e');
    }
  }
}
