import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_discover/feature/Register/ui/register_screen.dart';
import 'package:ju_discover/feature/campuses/ui/campus_detail.dart';
import 'package:ju_discover/feature/campuses/ui/campuses_screen.dart';
import 'package:ju_discover/feature/home/ui/tabs_screen.dart';
import 'package:ju_discover/feature/internship/ui/Internship_screen.dart';
import 'package:ju_discover/feature/login/ui/login_screen.dart';
import 'package:location/location.dart';
import 'feature/Register/bloc/register_bloc.dart';
import 'feature/campuses/bloc/campus_bloc.dart';
import 'feature/home/bloc/home_bloc.dart';
import 'feature/internship/bloc/internship_bloc.dart';
import 'feature/internship/ui/internship_detail_screen.dart';
import 'feature/login/bloc/login_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => InternshipBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
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
         CampusScreen.routName:(context)=>CampusScreen(),
         CampusDetailScreen.routeName:(context) => CampusDetailScreen(),
         InternshipScreen.routeName:(context) => InternshipScreen(),
         LoginScreen.routeName:(context) => LoginScreen(),
         RegisterScreen.routeName:(context) => RegisterScreen(),
         InternshipDetailScreen.routeName:(context) => InternshipDetailScreen(),


        }
      ),
    );
  }
}


// class Demo extends StatefulWidget {
//   const Demo({super.key});

//   @override
//   State<Demo> createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//    late GoogleMapController mapController;

//   final LatLng _center = const LatLng(7.6820, 36.8560);
//   final LatLng _hell = const LatLng(37.4223, -122.0848);
//   LatLng? _currentP;
//   @override
//   void initState() {
//     getLocationUpdates();
//     super.initState();
//   }

//   final _locationController = new Location();

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: _center,
//         zoom: 13.0,
//       ),
//       markers: {
//         Marker(
//             markerId: MarkerId("_destinationLocation"),
//             icon: BitmapDescriptor.defaultMarker,
//             position: _center),

//             if(_currentP != null)

            
//         Marker(
//             markerId: MarkerId("_currentLocation"),
//             icon: BitmapDescriptor.defaultMarker,
//             position: _currentP!),
      
//       },
//     );
//   }

//  Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     // Check if the location service is enabled
//     _serviceEnabled = await _locationController.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//       if (!_serviceEnabled) {
//         print('Location service not enabled');
//         return; // Exit if service is not enabled
//       }
//     }

//     // Check if permission is granted
//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       // Request permission if not granted
//       _permissionGranted = await _locationController.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         print('Permission denied');
//         return; // Exit if permission is not granted
//       }
//     }

//     // Now, listen for location updates if permission and service are enabled
//     _locationController.onLocationChanged
//         .listen((LocationData currentLocation) {
//       if (currentLocation != null) {
//         setState(() {
//           _currentP =
//               LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           print(
//               'Current location: ${currentLocation.latitude}, ${currentLocation.longitude}');
//         });
//       } else {
//         print('Received null location');
//       }
//     });
//   }


// }

class LocationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Vista_do_Rio_de_Janeiro_a_partir_do_Corcovado.jpg/1280px-Vista_do_Rio_de_Janeiro_a_partir_do_Corcovado.jpg', // Replace with your image URL
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        // Overlay with Gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              stops: const [0.6, 1], // Adjust stops for gradient effect
            ),
          ),
        ),

        // Content Card
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rio de Janeiro',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                           Icon(Icons.favorite_border),
                        ],
                      ),
                      Row(children: [
                        Icon(Icons.location_on,color: Colors.green,),
                        Text('Brazil',style: TextStyle(color: Colors.green),),
                      ],),
                      Row(children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        Text('5.0',style: TextStyle(color: Colors.black),),
                        Text('143 reviews',style: TextStyle(color: Colors.grey),),
                      ],),
                      SizedBox(height: 8),
                      Text(
                        'Rio de Janeiro, often simply called Rio, is one of Brazil\'s most iconic cities, renowned for...',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          // Handle "Read more" tap
                        },
                        child: Text(
                          'Read more',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
         Positioned(
          top: 40,
          left: 16,
          child: InkWell(
            onTap: (){},
            child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
          ),
        ),
      ],
    );
  }
}