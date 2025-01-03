import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../campuses/ui/campuses_screen.dart';
import '../../internship/ui/Internship_screen.dart';
import '../bloc/home_bloc.dart';
import 'home_category_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeNavigateToCategoriesDetailScreenState) {
          final successState =
              state as HomeNavigateToCategoriesDetailScreenState;
          if (successState.selectedCategory == 'campuses') {
            Navigator.of(context).pushNamed(
              CampusScreen.routName,
              
            );
          }
          if (successState.selectedCategory == 'Internships') {
            Navigator.of(context).pushNamed(
              InternshipScreen.routeName,
              
            );
          }
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(bottom: 50, top: 23, right: 50, left: 50),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SearchBar(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                hintText: 'Search',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItems(
                      categoryName: 'campuses',
                      imageUrl: 'assets/icons/campus.png'),
                  HomeItems(
                      categoryName: 'Colleges',
                      imageUrl: 'assets/icons/college.png'),
                  HomeItems(
                      categoryName: 'Departments',
                      imageUrl: 'assets/icons/department.png'),
                  HomeItems(
                      categoryName: 'Internships',
                      imageUrl: 'assets/icons/internship.png'),
                ],
              ),
            ),

            /*  First row Ends Here */

            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItems(
                      categoryName: 'Researches',
                      imageUrl: 'assets/icons/research.png'),
                  HomeItems(
                      categoryName: 'SRS', imageUrl: 'assets/icons/srs.png'),
                  HomeItems(
                      categoryName: 'News', imageUrl: 'assets/icons/news.png'),
                  HomeItems(
                      categoryName: 'Clubs', imageUrl: 'assets/icons/club.png'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset('assets/images/JU1.jpg',
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Card(
                color: Colors.white,
                elevation: 8,
                child: Column(
                  children: [
                    Text('What is happening ?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                            child: Image.asset(
                          'assets/images/health.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )),
                        radius: 30,
                      ),
                      title: Text('Dr.kelkiyas Mio'),
                      subtitle: Text('Cure for diabetes '),
                      trailing: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 20, 94, 221),
                        ),
                        child: Text(
                          'view more',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                            child: Image.asset(
                          'assets/images/ai.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )),
                        radius: 30,
                      ),
                      title: Text('miskir kasahun'),
                      subtitle: Text('technoloy,ai '),
                      trailing: Text(
                        'view more',
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                            child: Image.asset(
                          'assets/images/bank.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )),
                        radius: 30,
                      ),
                      title: Text('Naol chernet'),
                      subtitle: Text('Banking in Jimma '),
                      trailing: Text(
                        'view more',
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
