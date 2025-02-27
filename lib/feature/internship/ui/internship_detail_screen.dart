import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/internship/bloc/internship_bloc.dart';
import 'package:intl/intl.dart';
import '../../login/bloc/login_bloc.dart';
import '../bloc/internship_state.dart';

class InternshipDetailScreen extends StatefulWidget {
  static String routeName = 'internship/detail';
  const InternshipDetailScreen({super.key});

  @override
  State<InternshipDetailScreen> createState() => _InternshipDetailScreenState();
}

class _InternshipDetailScreenState extends State<InternshipDetailScreen> {
  // int? id;

  @override
  @override
  Widget build(BuildContext context) {
    final internshipId = ModalRoute.of(context)!.settings.arguments as int;

    void addInitialEvent() {
      context
          .read<InternshipBloc>()
          .add(InternshipDetailInitialEvent(internshipId: internshipId));
    }

    addInitialEvent();

    print('the arugment is $internshipId');
    final loginState = BlocProvider.of<LoginBloc>(context).state;
    final internshipState = BlocProvider.of<InternshipBloc>(context).state;
    return PopScope(
      onPopInvoked: (didPop) {
        context.read<InternshipBloc>().add(InternshipInitialEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 100, 178, 241),
          title: Text('Internship Detail'),
          actions: [
            (loginState is LoginSuccssState)
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout),
                    tooltip: 'logout',
                  )
                : Text('login')
          ],
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<InternshipBloc, InternshipState>(
            builder: (context, state) {
              if (state is InternshipDetailLoadedSuccessState) {
                final successState =
                    state as InternshipDetailLoadedSuccessState;
                final internship = successState.internship;
                return Container(
                  color: const Color.fromARGB(255, 100, 178, 241),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(internship.title,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Container( padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 20, 94, 221),
                        ),child: Text(internship.qouta.toString())),

                      ],),
                      Card(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Card(
                                  //     child: Container(
                                  //       width: double.infinity,
                                  //       decoration: BoxDecoration(
                                  //           border: Border.all(color: Colors.red),
                                  //           borderRadius: BorderRadius.only(
                                  //               topRight: Radius.circular(15),
                                  //               topLeft: Radius.circular(15))),
                                  //       padding: EdgeInsets.all(10),
                                  //       child: Text(internship.title,
                                  //           style: TextStyle(
                                  //               fontSize: 37,
                                  //               fontWeight: FontWeight.bold)),
                                  //     ),
                                  //   ), // TITLE CARD

                                  Card(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Description',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(internship.description),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  Card(
                                    child: Container(
                                      width: 200,
                                      height: 100,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Deadline',
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              DateFormat('d MMMM yyyy')
                                                  .format(internship.deadline),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Detail',
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // SizedBox(
                                          //   height: 2,
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Minimum CGPA required',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text('${internship.minimum_cgpa}')
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                DateFormat('d MMMM yyyy')
                                                    .format(
                                                        internship.start_date),
                                              )
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'End Date',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                DateFormat('d MMMM yyyy')
                                                    .format(
                                                        internship.end_date),
                                              )
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Status',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                DateFormat('d MMMM yyyy')
                                                    .format(
                                                        internship.end_date),
                                              ),
                                            ],
                                          ),
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
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            listener: (context, state) {},
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Apply'),
        ),
      ),
    );
  }
}
