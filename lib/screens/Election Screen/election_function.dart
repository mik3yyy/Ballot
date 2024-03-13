import 'package:ballot/global_comonents/myMessageHandler.dart';
import 'package:ballot/model/election.dart';
import 'package:ballot/provider/election_provider.dart';
import 'package:ballot/screens/Home%20Screen/home_screen.dart';
import 'package:ballot/settings/constants.dart';
import 'package:ballot/settings/http.dart';
import 'package:ballot/widgets/election.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElectionFunction {
  static Future<void> voteI(
      {required BuildContext context, required String election_id}) async {
    final electionProvider =
        Provider.of<ElectionProvider>(context, listen: false);
    try {
      var res = await HTTP.post(
          link: '${Constants.url}students/elections/$election_id/vote',
          // header: {
          //   "Accept": "application/json",
          //   'Content-Type': 'application/json',
          //   'token': token,
          // },
          body: {'votes': electionProvider.getRawVotes()});
      print(res);
      if (res['success'] != null) {
        MyMessageHandler.showSnackBar(context, "Successfully Voted",
            option: options.success);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        MyMessageHandler.showSnackBar(context, res['message']);
      }
    } catch (e) {
      print(e.toString());
      MyMessageHandler.showSnackBar(context, "Check your network");
    }
  }
}
