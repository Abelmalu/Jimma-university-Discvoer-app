import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/internship/bloc/internship_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Internship Detail')),
      body: SingleChildScrollView(
        child: BlocConsumer<InternshipBloc, InternshipState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is InternshipDetailLoadedSuccessState) {
               
              final successState = state as InternshipDetailLoadedSuccessState;
              final internship = successState.internship;
             
              return Column(
                children: [
                  Center(child: Text(internship.title)),
                  Text(internship.description),
                ],
              );
              
            }
            return Column(
              children: [],
            );
          },
        ),
      ),
    );
  }
}
