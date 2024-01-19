import 'package:flutter/material.dart';

import './voting_screen.dart';

class SummaryScreen extends StatelessWidget {
  final String electionName;
  final String electionDescription;
  final Map<String, String> votes;
  final List<Map<String, dynamic>> allPosts;

  const SummaryScreen({
    Key? key,
    required this.electionName,
    required this.electionDescription,
    required this.votes,
    required this.allPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Voting Summary',
              style: TextStyle(
                color: Color(0xffAE8D2F),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(electionDescription),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: votes.entries.map((entry) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${entry.key} - ${entry.value}'),
                        ElevatedButton(
                          onPressed: () => _editVote(context, entry.key),
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xffAE8D2F)),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          child: const Text('Edit'),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Color(0xff20448F),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      side: MaterialStatePropertyAll(
                        BorderSide(
                          color: Color(0xff20448F),
                        ),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement submit logic
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff20448F)),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _editVote(BuildContext context, String postName) {
    // Find candidates for the specific post
    List candidates =
        allPosts.firstWhere((post) => post.keys.first == postName).values.first;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => VotingScreen(
          electionTitle: electionName,
          allPosts: allPosts,
          postName: postName,
          candidates: candidates,
          electionDescription: electionDescription,
          votes: votes,
        ),
      ),
    );
  }
}
