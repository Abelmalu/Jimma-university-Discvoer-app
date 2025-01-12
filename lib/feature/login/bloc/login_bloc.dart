import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
    on<RegisterTextButtonPressedEvent>(registerTextButtonPressed);
  }

  FutureOr<void> loginButtonPressedEvent(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    try {
      final url = Uri.parse('http://192.168.1.5:8000/api/login');
      final response = await http.post(url,
          body: {"email": event.username, "password": event.password});
      final result = jsonDecode(response.body);
    

      if (result['success'] == true) {
        // Load and obtain the shared preferences for this app.
        final prefs = await SharedPreferences.getInstance();
        print('the token is ${result['token']}');
        final token = result['token'];

// Save the counter value to persistent storage under the 'counter' key.
        await prefs.setString('token', token);
        

// Try reading the counter value from persistent storage.
// If not present, null is returned, so default to 0.
        final tokenye = prefs.getString('token') ?? 0;
        print('the stored preference is ${tokenye}');

        emit(LoginSuccssState());
      } else if (result['success'] == false) {
        emit(LoginFailState());
      }
    } catch (e) {
      print('the error is $e');
    }
  }

  FutureOr<void> registerTextButtonPressed(
      RegisterTextButtonPressedEvent event, Emitter<LoginState> emit) {
    emit(RegisterTextButtonPressedState());
  }
}
