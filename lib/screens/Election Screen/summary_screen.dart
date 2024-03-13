import 'package:ballot/global_comonents/custom_button.dart';
import 'package:ballot/model/election.dart';
import 'package:ballot/model/vote.dart';
import 'package:ballot/provider/election_provider.dart';
import 'package:ballot/screens/Election%20Screen/election_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'voting_screen.dart';

class SummaryScreen extends StatefulWidget {
  final Election election;

  const SummaryScreen({Key? key, required this.election}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final electionProvider = Provider.of<ElectionProvider>(context);

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
            // Text(electionDescription),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, thickness: 1),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                Vote vote = electionProvider.votes[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${vote.postionName} - ${vote.optionName}'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VotingScreen(
                                    vote: vote,
                                    position: widget.election.positions
                                        .firstWhere((element) =>
                                            element.id == vote.position_id),
                                    election: widget.election)));
                      }, // _editVote(context, entry.key),
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30)),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffAE8D2F)),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
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
              },
              itemCount: electionProvider.votes.length,
            )),
            CustomButton(
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                await ElectionFunction.voteI(
                    context: context,
                    election_id: widget.election.id.toString());
                setState(() {
                  loading = false;
                });
              },
              title: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
