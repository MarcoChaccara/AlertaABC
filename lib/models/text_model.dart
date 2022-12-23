class ReporteModel {
  String name;
  String description;
  String date;
  String category;
  bool status;

  ReporteModel({
    required this.name,
    required this.description,
    required this.date,
    required this.category,
    required this.status,
  });

  factory ReporteModel.fromJson(Map<String, dynamic> json) => ReporteModel(
        name: json["name"],
        description: json["description"],
        date: json["date"],
        category: json["category"],
        status: json["status"],
      );
}
