import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(7.6820, 36.8560);
  final LatLng _hell = const LatLng(37.4223, -122.0848);
  LatLng? _currentP;
  @override
  void initState() {
    getLocationUpdates();
    super.initState();
  }

  final _locationController = new Location();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
           
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13.0,
              ),
              markers: {
                Marker(
                    markerId: MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _center),
                if (_currentP != null)
                  Marker(
                      markerId: MarkerId("_currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _currentP!),
              },
            ),
          ),
      
          Container(
            width: double.infinity,
             padding: EdgeInsets.all(10),
      
            child: Card(
              margin: EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get in touch',
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                     leading: CircleAvatar(
                        child: ClipOval(
                          child: Icon(Icons.web)
                        ),
                        radius: 30,
                      ),
                      title:Text('www.ju.edu.et'),
                      subtitle: Text('Website'),
                    ),
                    ListTile(
                     leading: CircleAvatar(
                        child: ClipOval(
                          child: Icon(Icons.email)
                        ),
                        radius: 30,
                      ),
                      title:Text(' ero@ju.edu.et'),
                      subtitle: Text('Email'),
                    ),
                    ListTile(
                     leading: CircleAvatar(
                        child: ClipOval(
                          child: Icon(Icons.phone)
                        ),
                        radius: 30,
                      ),
                      title:Text('Phone'),
                      subtitle: Text('+251-(0)47-111-2202'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding:EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Social Media',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    
                    child: Container(
                       margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 151, 240, 166),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        
                        leading: CircleAvatar(
                          child: ClipOval(
                            child: Icon(Icons.facebook)
                          ),
                          radius: 30,
                        ),
                        title: Text('www.ju.edu.et'),
                        subtitle: Text('Facebook'),
                      ),
                    ),
                  ),
                  Container(
                     margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 216, 151),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                          child: Icon(Icons.telegram)
                        ),
                        radius: 30,
                      ),
                      title: Text(' ero@ju.edu.et'),
                      subtitle: Text('Telegram'),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 151, 200, 240),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: ClipOval(
                          child: Icon(Icons.youtube_searched_for),
                        ),
                        radius: 30,
                      ),
                      title: Text('378'),
                      subtitle: Text('P.O.Box'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation != null && currentLocation != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print('the current location is ${currentLocation}');
        });
      }
    });
  }
}
