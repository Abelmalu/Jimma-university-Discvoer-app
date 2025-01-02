import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/campuses/bloc/campus_event.dart';
import 'package:ju_discover/feature/campuses/bloc/campus_state.dart';
import '../../../data/models/campus_model.dart';
import '../bloc/campus_bloc.dart';
import 'package:ju_discover/feature/campuses/ui/campus_detail.dart';

class CampusItem extends StatefulWidget {
  final Campus campus;

  const CampusItem({super.key, required this.campus});

  @override
  State<CampusItem> createState() => _CampusItemState();
}

class _CampusItemState extends State<CampusItem> {
  void sectedCampus() {
    print('hellow');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CampusBloc, CampusState>(
      listenWhen: (previous, current) => current == CampusNavigateToCampusDetailState,
      listener: ((context, state) {
        if (state is CampusNavigateToCampusDetailState) {
          final successState = state as CampusNavigateToCampusDetailState;
          // if (successState.selectedCampus == 'main campus') {
          
         
          // }
        }
      }),
      child: InkWell(
        onTap: () => {
          context
              .read<CampusBloc>()
              .add(CampusItemPressedEvent(selectedCampus: widget.campus.name))
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Card(
            elevation: 7,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(widget.campus.imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.campus.name),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          Text(widget.campus.location),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
