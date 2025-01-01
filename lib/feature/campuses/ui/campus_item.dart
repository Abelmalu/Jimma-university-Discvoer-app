import 'package:flutter/material.dart';

import '../../../data/models/campus_model.dart';

class CampusItem extends StatefulWidget {
  final Campus campus;

  const CampusItem({super.key, required this.campus});

  @override
  State<CampusItem> createState() => _CampusItemState();
}

class _CampusItemState extends State<CampusItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Card(
          elevation: 7,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(widget.campus.imageUrl,height:250, width:double.infinity,fit:BoxFit.cover),
              ),
              Padding(
      
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.campus.name), 
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        Text(widget.campus.location),
                      ],
                    )
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
