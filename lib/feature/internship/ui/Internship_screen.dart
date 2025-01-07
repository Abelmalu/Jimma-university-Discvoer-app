import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ju_discover/feature/internship/bloc/internship_bloc.dart';

import 'package:ju_discover/feature/login/ui/login_screen.dart';

import '../bloc/internship_state.dart';

class InternshipScreen extends StatefulWidget {
  static String routeName = '/internship';
  const InternshipScreen({super.key});

  @override
  State<InternshipScreen> createState() => _InternshipScreenState();
}

class _InternshipScreenState extends State<InternshipScreen> {
  @override
  initState() {
    BlocProvider.of<InternshipBloc>(context).add(InternshipInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternshipBloc, InternshipState>(
      buildWhen: (previous, current) => current is ! InternshipActionState ,
      builder: (context, state) {

        
        if (state is InternshipInitialState) {
          return Scaffold(
            appBar: AppBar(title: Text('internships')),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is InternshipLoadingSuccessState) {
          final successState = state as InternshipLoadingSuccessState;
          print('the data is ${successState.internships}');
          return Scaffold(
            appBar: AppBar(title: Text('Internships')),
            body: ListView(
              children: [
                Container(
                  child: Card(
                    elevation: 8,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/images/internscreen.jpg',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child: Container(
                            width: 200,
                            color: Colors.black54,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Text(
                              'Get Internships',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Container(
                                width: 150,
                                height: 100,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Applications'),
                                    Text('20'),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              child: Container(
                                width: 150,
                                height: 100,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Applicants'),
                                    Text('8'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 5,
                              // color: Color.fromARGB(255, 151, 240, 166),
                              child: Container(
                                width: 150,
                                height: 100,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Internships'),
                                    Text('${successState.internships.length}'),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              child: Container(
                                width: 150,
                                height: 100,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Departments'),
                                    Text('5'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /** internships  */

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: successState.internships.map((internship) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: ClipOval(
                              child: Text(
                            '${internship.id}',
                          )),
                          radius: 30,
                        ),
                        title: Text('${internship.title}'),
                        subtitle: Text('${internship.description}'),
                        trailing: InkWell(
                          onTap: () {
                            context.read<InternshipBloc>().add(
                                InternshipNavigateToLoginEvent(
                                    internshipId: internship.id!));
                          },
                          child: Text(
                            'view more',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      listener: (context, state) {
        if (state is InternshipNavigateToLoginScreenState) {
          
          final navigateToLoginState =
              state as InternshipNavigateToLoginScreenState;
          final internshipId = navigateToLoginState.internshipId;
          Navigator.of(context)
              .pushNamed(LoginScreen.routeName, arguments: internshipId)
              .then((data) {
            BlocProvider.of<InternshipBloc>(context)
                .add(InternshipInitialEvent());
          });
        }
      },
    );
  }
}
