import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/Register/bloc/register_bloc.dart';
import 'package:ju_discover/feature/home/ui/home_screen.dart';
import 'package:ju_discover/feature/login/bloc/login_bloc.dart';

import '../../internship/bloc/internship_bloc.dart';
import '../../internship/ui/internship_detail_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  String? programController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void initState() {
    BlocProvider.of<RegisterBloc>(context)
        .add(RegisterInitialEvent(currentProgram: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final internshipId = ModalRoute.of(context)!.settings.arguments as int;
    print('the arugment is $internshipId');
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              Navigator.of(context).pushReplacementNamed(
                  InternshipDetailScreen.routeName,

                  arguments: internshipId
                  
                  ).then((data){
                 BlocProvider.of<InternshipBloc>(context)
              .add(InternshipInitialEvent());


              });
            }
          },
          builder: (context, state) {
            if (state is RegisterErrorState) {
              final errorState = state as RegisterErrorState;
              final errors = errorState.errors;

              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Register',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10,
                  ),

                  /**First Name */
                  (errors.containsKey('name'))
                      ? Text('${errors['name'][0]}',
                          style: TextStyle(color: Colors.red))
                      : Text(''),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                          label: Text('First Name'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /**University */
                  (errors.containsKey('university'))
                      ? Text('${errors['university'][0]}',
                          style: TextStyle(color: Colors.red))
                      : Text(''),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: TextField(
                      controller: universityController,
                      decoration: InputDecoration(
                          label: Text('University'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /**Program */

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        state is RegisterErrorState;
                        final successState = state as RegisterErrorState;
                        List currentPrograms = successState.programs;
                        int currentIndex = successState.currentProgram;
                        String selectedValueDropDown =
                            currentPrograms[currentIndex].name;
                        programController = selectedValueDropDown;

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          width: double.infinity,
                          child: DropdownButton(
                            value: selectedValueDropDown,
                            onChanged: (value) {
                              final currentProgram =
                                  currentPrograms.firstWhere((program) {
                                return program.name == value;
                              });
                              print(currentProgram.id);
                              currentIndex = currentProgram.id - 1;
                              print(currentProgram.name);

                              BlocProvider.of<RegisterBloc>(context).add(
                                  RegisterInitialEvent(
                                      currentProgram: currentIndex));
                            },
                            menuMaxHeight: double.infinity,
                            items: successState.programs.map((program) {
                              return DropdownMenuItem(
                                child: Text(program.name),
                                value: program.name,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /** Email */
                  (errors.containsKey('email'))
                      ? Text('${errors['email'][0]}',
                          style: TextStyle(color: Colors.red))
                      : Text(''),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          label: Text('Email'), border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /** password */
                  (errors.containsKey('password'))
                      ? Text('${errors['password'][0]}',
                          style: TextStyle(color: Colors.red))
                      : Text(''),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /** Confirm password */
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    child: TextField(
                      controller: passwordConfirmationController,
                      decoration: InputDecoration(
                          label: Text('Confirm Password'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /** Register*/
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
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            context.read<RegisterBloc>().add(
                                RegisterButtonPressedEvent(
                                    firstName: firstNameController.text,
                                    university: universityController.text,
                                    program: programController!,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text));
                            emailController.clear();
                            passwordController.clear();
                            firstNameController.clear();
                            universityController.clear();
                            passwordController.clear();
                            passwordConfirmationController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 62),
                            child: Text('Already has an Account? '),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Login here.',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            // if(state is RegisterInitialState || state is RegisterSuccessState ){

            // }
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Register',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10,
                ),

                /**First Name */

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        label: Text('First Name'),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /**University */
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: TextField(
                    controller: universityController,
                    decoration: InputDecoration(
                        label: Text('University'),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /**Program */

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterProgramsLoadingState) {
                        final successState =
                            state as RegisterProgramsLoadingState;
                        List currentPrograms = successState.programs;
                        int currentIndex = successState.currentProgram;
                        String selectedValueDropDown =
                            currentPrograms[currentIndex].name;
                        programController = selectedValueDropDown;

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          width: double.infinity,
                          child: DropdownButton(
                            value: selectedValueDropDown,
                            onChanged: (value) {
                              final currentProgram =
                                  currentPrograms.firstWhere((program) {
                                return program.name == value;
                              });
                              print(currentProgram.id);
                              currentIndex = currentProgram.id - 1;
                              print(currentProgram.name);

                              BlocProvider.of<RegisterBloc>(context).add(
                                  RegisterInitialEvent(
                                      currentProgram: currentIndex));
                            },
                            menuMaxHeight: double.infinity,
                            items: successState.programs.map((program) {
                              return DropdownMenuItem(
                                child: Text(program.name),
                                value: program.name,
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return DropdownButton(
                          onChanged: (value) {},
                          items: [
                            DropdownMenuItem(
                                child: CircularProgressIndicator())
                          ],
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /** Email */

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text('Email'), border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /** password */

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        label: Text('Password'), border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /** Confirm password */
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 0, bottom: 0),
                  child: TextField(
                    controller: passwordConfirmationController,
                    decoration: InputDecoration(
                        label: Text('Confirm Password'),
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /** Register*/
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
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          context.read<RegisterBloc>().add(
                              RegisterButtonPressedEvent(
                                  firstName: firstNameController.text,
                                  university: universityController.text,
                                  program: programController!,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirmation:
                                      passwordConfirmationController.text));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 62),
                          child: Text('Already has an Account? '),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: InkWell(
                              onTap: () {},
                              child: Text(
                                'Login here.',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
