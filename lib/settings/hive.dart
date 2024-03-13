import 'package:ballot/model/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveFunction {
  static var ballotBox = Hive.box('ballot');
  static void insertToken(String token) {
    ballotBox.put("token", token);
  }

  static String getToken() {
    return ballotBox.get("token");
  }

  static void deleteToken() {
    ballotBox.delete("token");
  }

  static bool tokenExist() {
    return ballotBox.get("token") != null;
  }

  static saveUser(UserModel user) {
    return ballotBox.put('user', user.toMap());
  }

  static bool userExist() {
    return ballotBox.get("user") != null;
  }

  static UserModel getUser() {
    return UserModel.fromMap(ballotBox.get("user"));
  }
}
