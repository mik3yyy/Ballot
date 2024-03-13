// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// A model for saving the user's infromation from google

class UserModel {
  final String displayName;
  final String email;
  final String matric_no;
  UserModel({
    required this.displayName,
    required this.email,
    required this.matric_no,
  });

  UserModel copyWith({
    String? displayName,
    String? email,
    String? matric_no,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      matric_no: matric_no ?? this.matric_no,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': displayName,
      'email': email,
      'matric_no': matric_no,
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      displayName: map['name'] as String,
      email: map['email'] as String,
      matric_no: map['matric_no'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(displayName: $displayName, email: $email, matric_no: $matric_no)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName &&
        other.email == email &&
        other.matric_no == matric_no;
  }

  @override
  int get hashCode =>
      displayName.hashCode ^ email.hashCode ^ matric_no.hashCode;
}
