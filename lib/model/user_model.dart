// A model for saving the user's infromation from google

class UserModel {
  final String displayName;
  final String email;
  final String id;
  final String? photoUrl;
  final String? serverAuthCode;

  UserModel({required this.displayName, required this.email, required this.id, this.photoUrl, this.serverAuthCode});
}
