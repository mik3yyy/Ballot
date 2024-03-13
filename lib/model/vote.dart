// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Vote {
  final int position_id;
  final int option_id;
  final String postionName;
  final String optionName;
  Vote({
    required this.position_id,
    required this.option_id,
    required this.postionName,
    required this.optionName,
  });

  Vote copyWith({
    int? position_id,
    int? option_id,
    String? postionName,
    String? optionName,
  }) {
    return Vote(
      position_id: position_id ?? this.position_id,
      option_id: option_id ?? this.option_id,
      postionName: postionName ?? this.postionName,
      optionName: optionName ?? this.optionName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position_id': position_id,
      'option_id': option_id,
      'postionName': postionName,
      'optionName': optionName,
    };
  }

  factory Vote.fromMap(Map<String, dynamic> map) {
    return Vote(
      position_id: map['position_id'] as int,
      option_id: map['option_id'] as int,
      postionName: map['postionName'] as String,
      optionName: map['optionName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vote.fromJson(String source) =>
      Vote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vote(position_id: $position_id, option_id: $option_id, postionName: $postionName, optionName: $optionName)';
  }

  @override
  bool operator ==(covariant Vote other) {
    if (identical(this, other)) return true;

    return other.position_id == position_id &&
        other.option_id == option_id &&
        other.postionName == postionName &&
        other.optionName == optionName;
  }

  @override
  int get hashCode {
    return position_id.hashCode ^
        option_id.hashCode ^
        postionName.hashCode ^
        optionName.hashCode;
  }
}
