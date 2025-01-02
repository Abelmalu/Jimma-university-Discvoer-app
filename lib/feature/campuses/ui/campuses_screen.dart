import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/data/dummy_data.dart';
import 'package:ju_discover/feature/campuses/bloc/campus_state.dart';
import 'package:ju_discover/feature/campuses/ui/campus_item.dart';

import '../bloc/campus_bloc.dart';
import '../bloc/campus_event.dart';
import 'campus_detail.dart';

class CampusScreen extends StatefulWidget {
  static String routName = '/campuses';
  const CampusScreen();

  @override
  State<CampusScreen> createState() => _CampusScreenState();
}

class _CampusScreenState extends State<CampusScreen> {
  initState() {
    BlocProvider.of<CampusBloc>(context).add(CampusInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CampusBloc, CampusState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case CampusInitialState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case CampusLoadingSuccsessState:
            final success = state as CampusLoadingSuccsessState;
            final successCampuses = success.campuses;
            return Scaffold(
              appBar: AppBar(
                title: Text('Campuses'),
              ),
              body: ListView.builder(
                  itemCount: successCampuses.length,
                  itemBuilder: (context, index) {
                    return CampusItem(
                      campus: successCampuses[index],
                    );
                  }),
            );

          default:
            return Text('wrong');
        }
      },
      listener: (context, state) {
        if (state is CampusNavigateToCampusDetailState) {
          final successState = state as CampusNavigateToCampusDetailState;

          Navigator.of(context).pushNamed(
            CampusDetailScreen.routeName,
            arguments: {'name': successState.selectedCampus},
            
          );
          

          BlocProvider.of<CampusBloc>(context).add(CampusInitialEvent());
        }
      },
    );
  }
}
