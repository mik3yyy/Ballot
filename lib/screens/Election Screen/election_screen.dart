import 'dart:math';

import 'package:ballot/global_comonents/custom_button.dart';
import 'package:ballot/model/election.dart';
import 'package:ballot/model/position.dart';
import 'package:ballot/provider/election_provider.dart';
import 'package:ballot/screens/Election%20Screen/summary_screen.dart';
import 'package:ballot/screens/Election%20Screen/voting_screen.dart';
import 'package:dialog_alert/dialog_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElectionScreen extends StatelessWidget {
  final Election electionData;

  const ElectionScreen({Key? key, required this.electionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final electionProvider = Provider.of<ElectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final result = await showDialogAlert(
              context: context,
              title: 'Are you sure',
              message: 'Do you want to Leave this election?',
              actionButtonTitle: 'Leave',
              cancelButtonTitle: 'Cancel',
              actionButtonTextStyle: const TextStyle(
                color: Colors.red,
              ),
              cancelButtonTextStyle: const TextStyle(
                color: Colors.black,
              ),
            );
            if (result == ButtonActionType.action) {
              electionProvider.resetVotes();
              Navigator.pop(context);
            }
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40,
          ),
        ),
        title: const Text('Back'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Vote is secure, your Vote counts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'What do you want to do today?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              electionData.name,
              style: const TextStyle(
                color: Color(0xffAE8D2F),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              electionData.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                Position position = electionData.positions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VotingScreen(
                          position: position,
                          election: electionData,
                          // vo/ Initialize an empty map for votes
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xffAE8D2F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                position.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Participate in the democratic process and select your future ${electionData.name} ${position.name}.',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: electionData.positions.length,
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: CustomButton(
          enable:
              electionData.positions.length == electionProvider.votes.length,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SummaryScreen(election: electionData)),
            );
          },
          title: "Save",
        ),
      ),
    );
  }

  // List<Widget> _buildPosts(List<Position> data, BuildContext context) {
  //   List<Widget> postWidgets = [];
  //   if (data.containsKey('posts')) {
  //     List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(
  //         data['posts'].map((post) => Map<String, dynamic>.from(post)));

  //     for (var post in posts) {
  //       post.forEach((postName, candidates) {
  //         String electionName = data['title']
  //             .split(' ')[0]; // Get first word of the election title
  //         postWidgets.add(
  //           Container(
  //             padding: const EdgeInsets.all(20),
  //             margin: const EdgeInsets.only(bottom: 10),
  //             decoration: BoxDecoration(
  //               color: const Color(0xffAE8D2F),
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         postName,
  //                         style: const TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       Text(
  //                         'Participate in the democratic process and select your future $electionName $postName.',
  //                         style: const TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: const Icon(
  //                     Icons.navigate_next,
  //                     color: Colors.white,
  //                   ),
  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => VotingScreen(
  //                           electionTitle: data['title'],
  //                           allPosts: posts,
  //                           postName: postName,
  //                           candidates: candidates,
  //                           electionDescription: data['description'],
  //                           votes: {}, // Initialize an empty map for votes
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     }
  //   }
  //   return postWidgets;
  // }
}
