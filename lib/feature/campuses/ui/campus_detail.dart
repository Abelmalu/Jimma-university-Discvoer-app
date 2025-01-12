import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/dummy_data.dart';

class CampusDetailScreen extends StatelessWidget {
  static final String routeName = '/campus-detail';
  const CampusDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final campusName = ModalRoute.of(context)?.settings.arguments as Map;
    final campus = CAMPUSES.firstWhere((campus) {
      return campus.name == campusName['name'];
    });
    print(campus.description);
    campus.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(campusName['name']),
      ),
      body: ListView(
        children: [
          Card(
             margin: EdgeInsets.zero,
            child: Container(
              // margin: EdgeInsets.only(bottom:20),
              padding: const EdgeInsets.all(17.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          child: ClipOval(
                              child: Image.asset(
                            campus.imageUrl,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          )),
                          radius: 30,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            campus.name,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(campus.location),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                       SizedBox(width: 10),
                      Column(
                        children: [Text('Students',style: TextStyle(fontSize:18,fontWeight: FontWeight.w400),), Text('1500',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          )],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [Text('Staffs',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ), Text('400',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          )],
                      ),
                    ],
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 151, 200, 240),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Opened'),
                            Text('1991'),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                         color: Color.fromARGB(255, 151, 240, 166),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dean'),
                            Text('Abel Malu'),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 216, 151),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Department'),
                            Text('5'),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
             color: Colors.white,
            elevation: 8,
            child: ExpansionTile(
              title: Text('History'),
              leading: Icon(Icons.history),
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(campus.description)),
              ],
            ),
          ),
          
          Card(
           color: Colors.white,
            elevation: 8,
            child: ExpansionTile(
              title: Text('Mission and vision'),
              leading: Icon(Icons.label_important),
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(campus.description)),
              ],
            ),
          ),
          
          Card(
           color: Colors.white,
            elevation: 8,
            child: ExpansionTile(
              title: Text('Academics'),
              leading: Icon(Icons.abc),
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(campus.description)),
              ],
            ),
          ),
       
          Card(
            color: Colors.white,
            elevation: 8,
            child: ExpansionTile(
              title: Text('Libraries'),
              leading: Icon(Icons.library_add),
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(campus.description)),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
