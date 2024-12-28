import 'package:flutter/material.dart';

import 'feature/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jimma University',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          
          
        )
        .copyWith(

    primary: Colors.green[900], 
    secondary: Colors.green[900], 
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Theme.of(context).primaryColor,
    foregroundColor: Colors.white,
  )

      ),
      home: const HomeScreen(),
    );
  }
}
