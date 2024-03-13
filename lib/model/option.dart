class Option {
  int id;
  DateTime createdAt;
  String name;
  String bio;
  int voteCount;

  Option({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.bio,
    required this.voteCount,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        name: json['name'],
        bio: json['bio'],
        voteCount: json['vote_count'],
      );
}
