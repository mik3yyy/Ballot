import 'package:ballot/global_comonents/myMessageHandler.dart';
import 'package:ballot/model/election.dart';
import 'package:ballot/provider/election_provider.dart';
import 'package:ballot/settings/constants.dart';
import 'package:ballot/settings/http.dart';
import 'package:ballot/widgets/election.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFunction {
  static Future<void> getData({
    required BuildContext context,
  }) async {
    final electionProvider =
        Provider.of<ElectionProvider>(context, listen: false);

    try {
      var res = await HTTP.get(
        link: '${Constants.url}students/elections',
      );
      print(res);

      if (res['success']) {
        print(res);
        List<Election> elections = [];

        for (var election in res['data']) {
          var res2 = await HTTP.get(
            link: '${Constants.url}students/elections/${election['id']}',
          );
          print('-----');
          elections.add(Election.fromJson(res2['data']));
        }
        electionProvider.saveElection(elections);
      } else {
        MyMessageHandler.showSnackBar(context, res['detail']);
      }
    } catch (e) {
      MyMessageHandler.showSnackBar(context, "Check your network");
    }
  }
}
