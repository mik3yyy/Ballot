import 'dart:math';

import 'package:ballot/model/election.dart';
import 'package:ballot/model/vote.dart';
import 'package:flutter/foundation.dart';

class ElectionProvider with ChangeNotifier {
  List<Election>? upcomingElections;
  List<Vote> votes = [];
  ElectionProvider() {
    // Initialize with hardcoded data
    // loadElections();
  }

  // List get upcomingElections => _upcomingElections;
  saveElection(List<Election> elections) {
    upcomingElections = elections;
    notifyListeners();
  }

  void addOrReplaceVote(Vote newVote) {
    // Find the index of existing vote with the same position_id
    int existingVoteIndex =
        votes.indexWhere((vote) => vote.position_id == newVote.position_id);

    if (existingVoteIndex != -1) {
      // If exists, replace
      votes[existingVoteIndex] = newVote;
    } else {
      // If doesn't exist, add
      votes.add(newVote);
    }

    // Notify listeners about the change
    notifyListeners();
  }

  resetVotes() {
    votes = [];
    notifyListeners();
  }

  List<Map<String, dynamic>> getRawVotes() {
    List<Map<String, dynamic>> v = [];
    for (Vote vote in votes) {
      v.add({'position_id': vote.position_id, 'option_id': vote.option_id});
    }
    return v;
  }
}
