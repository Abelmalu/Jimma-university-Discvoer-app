import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InternshipScreen extends StatefulWidget {
  static String routeName = '/internship';
  const InternshipScreen({super.key});

  @override
  State<InternshipScreen> createState() => _InternshipScreenState();
}

class _InternshipScreenState extends State<InternshipScreen> {
  @override
  void initState() {
    fetchInternships();

    super.initState();
  }

  void fetchInternships() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/internship'));

    final result = jsonDecode(response.body);
    print(result[1]['title']);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('welcome to the internship page'));
  }
}
