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
          backgroundColor: const Color.fromARGB(255, 165, 209, 245),
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
                  color: const Color.fromARGB(255, 165, 209, 245),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30)),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 221, 174, 20),
                              ),
                              child: Text(internship.title,
                                  style: TextStyle(fontSize: 25)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          margin: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
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
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Divider(),
                                    Container(
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
                                                fontWeight: FontWeight.bold,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Divider(),
                                    Padding(
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
                                                'Quota',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                internship.qouta.toString(),
                                              ),
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
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.yellow,
                                                ),
                                                child: Text(
                                                  internship.status == 1
                                                      ? 'Accepting Applicants'
                                                      : internship.status == 2
                                                          ? 'Closed'
                                                          : internship.status ==
                                                                  3
                                                              ? 'Started'
                                                              : 'Unknown Status',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Application Submitted Successfully!'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .green, // Set the background color
                                    foregroundColor:
                                        Colors.white, // Set the text color
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                  ),
                                  child: Text(
                                    'Apply ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}
