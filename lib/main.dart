import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/home/tabs_screen.dart';

import 'feature/campuses/bloc/campus_bloc.dart';
import 'feature/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (context) => CampusBloc(),
        ),
       
      ],
      
      child: MaterialApp(
        title: 'Jimma University',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
      
          
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            
            
          )
          .copyWith(
      
      primary:  Color.fromARGB(174, 2, 3, 1),
      secondary: Colors.green[900], 
        ),
        appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(174, 2, 3, 1),
      
      
      foregroundColor: Colors.white,
      
        )
      
        ),
        
        routes:{
          '/':(context) => TabsScreen(),


        }
      ),
    );
  }
}


class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:Text('what the fuck'));
  }
}