import 'package:ballot/global_comonents/myMessageHandler.dart';
import 'package:ballot/screens/Home%20Screen/home_function.dart';
import 'package:ballot/screens/Home%20Screen/home_screen.dart';
import 'package:ballot/settings/constants.dart';
import 'package:ballot/settings/hive.dart';
import 'package:ballot/settings/http.dart';
import 'package:flutter/material.dart';

class SigninFunction {
  static Future<void> googleAuth({
    required String token,
    required BuildContext context,
  }) async {
    try {
      var res = await HTTP.post(
        link: '${Constants.url}students/auth/google',
        header: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token': token,
        },
      );
      if (res['success']) {
        HiveFunction.insertToken(res['data']['token']);
        await HomeFunction.getUserData(context: context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        MyMessageHandler.showSnackBar(context, res['detail']);
      }
    } catch (e) {
      MyMessageHandler.showSnackBar(context, "Check your network");
    }
  }
}
