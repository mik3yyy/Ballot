import 'package:ballot/model/position.dart';

class Election {
  int id;
  DateTime createdAt;
  String name;
  String description;
  bool votingEnabled;
  DateTime electionDate;
  List<Position> positions;

  Election({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.votingEnabled,
    required this.electionDate,
    required this.positions,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        name: json['name'],
        description: json['description'],
        votingEnabled: json['voting_enabled'],
        electionDate: DateTime.parse(json['election_date']),
        positions: List<Position>.from(
            json['positions'].map((x) => Position.fromJson(x))),
      );
}
