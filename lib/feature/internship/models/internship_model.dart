import 'dart:convert';

class Internship {
  int ?id;
  int ? department_id;
  String title;
  String description;
  String ?minimum_cgpa;
  int qouta;
  DateTime start_date;
  DateTime end_date;
  DateTime deadline;
  int status;
  int state;

  Internship(
      {
         required this.state,
        required this.minimum_cgpa,
       this.id,
       this.department_id,
      required this.title,
      required this.description,
      required this.qouta,
      required this.start_date,
      required this.end_date,
      required this.deadline,
      required this.status});

  factory Internship.fromJson(Map<String, dynamic> json) => Internship(
        id: json["id"],
        department_id: json["department_id"],
        title: json["title"],
        description: json["description"],
        minimum_cgpa: json["minimum_cgpa"],
        qouta: json["quota"],
        deadline: DateTime.parse(json["deadline"]),
        start_date: DateTime.parse(json["start_date"]),
        end_date: DateTime.parse(json["end_date"]),
        status: json["status"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department_id": department_id,
        "title": title,
        "description": description,
        "minimum_cgpa": minimum_cgpa,
        "quota": qouta,
        "deadline": deadline.toIso8601String(),
        "start_date": start_date.toIso8601String(),
        "end_date": end_date.toIso8601String(),
        "status": status,
      };
}
