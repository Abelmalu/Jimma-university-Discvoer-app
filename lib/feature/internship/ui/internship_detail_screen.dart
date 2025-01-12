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
    return Scaffold(
      appBar: AppBar(
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
        child: Card(
           margin: EdgeInsets.zero,
          elevation: 7,
          child: BlocConsumer<InternshipBloc, InternshipState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is InternshipDetailLoadedSuccessState) {
                final successState =
                    state as InternshipDetailLoadedSuccessState;
                final internship = successState.internship;

                return Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(internship.title,
                            style: TextStyle(
                                fontSize: 37, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(internship.description),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.grey.shade200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Deadline',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold)),
                            Text(
                              DateFormat('d MMMM yyyy')
                                  .format(internship.deadline),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                      SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Minimum CGPA required',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text('${internship.minimum_cgpa}')
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Start Date',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                DateFormat('d MMMM yyyy')
                                    .format(internship.start_date),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'End Date',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                DateFormat('d MMMM yyyy')
                                    .format(internship.end_date),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                DateFormat('d MMMM yyyy')
                                    .format(internship.end_date),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Column(
                children: [],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Apply'),
      ),
    );
  }
}
