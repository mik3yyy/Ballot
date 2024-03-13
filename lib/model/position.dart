import 'package:ballot/model/option.dart';

class Position {
  int id;
  DateTime createdAt;
  String name;
  String description;
  bool isRequired;
  List<Option> options;

  Position({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.isRequired,
    required this.options,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        name: json['name'],
        description: json['description'],
        isRequired: json['is_required'],
        options:
            List<Option>.from(json['options'].map((x) => Option.fromJson(x))),
      );
}
