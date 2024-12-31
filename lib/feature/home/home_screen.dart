import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ju_discover/feature/campuses/ui/campuses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50, top: 23, right: 50, left: 50),
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
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return CampusScreen();
                    }));
                  },
                  child: Card(
                    child: Container(
                      width: 90,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/campus.png',
                            height: 30,
                          ),
                          Text('Campuses'),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/college.png',
                          height: 30,
                        ),
                        Text('Colleges'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding:
                        EdgeInsets.only(top: 10, bottom: 3, left: 3, right: 3),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/department.png',
                          height: 30,
                        ),
                        Text('Departments'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/internship.png',
                          height: 30,
                        ),
                        Text('Internships'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/research.png',
                          height: 30,
                        ),
                        Text('Researches'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/srs.png',
                          height: 30,
                        ),
                        Text('SRS'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/news.png',
                          height: 30,
                        ),
                        Text('News'),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 90,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/club.png',
                          height: 30,
                        ),
                        Text('Clubs'),
                      ],
                    ),
                  ),
                ),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
    );
  }
}
