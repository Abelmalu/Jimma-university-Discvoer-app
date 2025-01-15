import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
   late GoogleMapController mapController;
      
        final LatLng _center = const LatLng(-33.86, 151.20);
      
       
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
                
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                );
  }
}