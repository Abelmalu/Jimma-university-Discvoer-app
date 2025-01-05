import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Register/ui/register_screen.dart';
import '../../internship/ui/Internship_screen.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccssState) {
          Navigator.of(context).pushNamed(InternshipScreen.routeName);
        }
        if (state is RegisterTextButtonPressedState) {
          Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName,
          
          
          
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('Login',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<LoginBloc, LoginState>(buildWhen: (previous, current) {
              // Return true if the current state is LoginFailState, so it rebuilds.
              return current is LoginFailState;
            }, builder: ((context, state) {
              if (state is LoginFailState) {
                return Text(
                  'Incorrect password or username',
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Text('');
              }
            })),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    label: Text('Enter username'),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    label: Text('Enter password'),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Set the background color here
                    ),
                    child: Text(
                      'Log in ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginButtonPressedEvent(
                          username: emailController.text,
                          password: passwordController.text));
                      print(emailController.text + passwordController.text);
                      emailController.clear();
                      passwordController.clear();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 62),
                    child: Text('did not have an acount? '),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: InkWell(
                        onTap: () {
                          context
                              .read<LoginBloc>()
                              .add(RegisterTextButtonPressedEvent());
                        },
                        child: Text(
                          'Register here.',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
