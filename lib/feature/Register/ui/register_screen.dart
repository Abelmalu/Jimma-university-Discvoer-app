import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/Register/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    BlocProvider.of<RegisterBloc>(context)
        .add(RegisterInitialEvent(currentProgram: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Register',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('First Name'), border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            /**University */
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('University'), border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            /**Program */

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (state is RegisterProgramsLoadingState) {
                    final successState = state as RegisterProgramsLoadingState;
                    List currentPrograms = successState.programs;
                    int currentIndex = successState.currentProgram ;
                    String selectedValue = currentPrograms[currentIndex].name;

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      width: double.infinity,
                      child: DropdownButton(
                        value: selectedValue,
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
                            child: Text('something wrong try again'))
                      ],
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),

            /** Email */

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('Email'), border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            /** password */

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('Password'), border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            /** Confirm password */
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('Confirm Password'),
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 50,
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
                    onPressed: () {},
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
                      child: Text('Already has an Account? '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Login here.',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
