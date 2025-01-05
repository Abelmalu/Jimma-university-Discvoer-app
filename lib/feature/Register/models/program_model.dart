class Program {
  int id;

  String name;
  String description;

  Program({
    required this.id,
    
    required this.name,
    required this.description,
  });

 factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json["id"],
        name:json["name"],
        description: json["description"],
       
      );
}
