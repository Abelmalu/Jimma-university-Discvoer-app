import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/campuses/ui/campuses_screen.dart';
import 'package:ju_discover/feature/internship/ui/Internship_screen.dart';

import '../bloc/home_bloc.dart';

class HomeItems extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  const HomeItems(
      {super.key, required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          context
              .read<HomeBloc>()
              .add(HomeCategoriesPressedEvent(categoryName));
        },
        child: Card(
          child: Container(
            width: 90,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Image.asset(
                  imageUrl,
                  height: 30,
                ),
                Text(categoryName),
              ],
            ),
          ),
        ),
     
    );
  }
}
