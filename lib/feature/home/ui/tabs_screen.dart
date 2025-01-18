import 'package:flutter/material.dart';
import 'package:ju_discover/feature/campuses/ui/campuses_screen.dart';
import 'package:ju_discover/feature/home/ui/home_screen.dart';

import '../../cotact/ui/contact_us_screen.dart';
import '../../history/ui/history_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Jimma University'},
      {'page': HistoryScreen(), 'title': 'History'},
      {'page': ContactUs(), 'title': 'Contact Us'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:  (_pages![_selectedPageIndex]['page'].runtimeType == HomeScreen)
    ? AppBar(
        title: const Text(
          'JImma University',
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 32, // Increase font size
          // Optional: Adjust font weight
          color: Colors.white, // Optional: Ensure the text is white
        ),
      )
    : AppBar(title: Text(_pages![_selectedPageIndex]['title'])),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            onTap: _selectPage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'history'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_page), label: 'ContactUs'),
            ],
          ),
        ),
      ),
    );
  }
}
