// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/user_model.dart';
// import '../provider/election_provider.dart';
// import '../provider/user_provider.dart';
// import '../widgets/election.dart';
// import '../widgets/no_election.dart';
// import 'screen_constants.dart';
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     UserModel? user = Provider.of<UserProvider>(context).user;
//     final electionProvider = Provider.of<ElectionProvider>(context);
//     return Container(
//       margin: const EdgeInsets.only(
//         left: 30,
//         right: 30,
//         top: 20,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Hi ${user?.displayName}!',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         overflow: TextOverflow
//                             .ellipsis, // Optional: prevent text overflow
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         'What do you want to do today?',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   constraints: const BoxConstraints(
//                     minWidth: 24,
//                     minHeight: 24,
//                   ),
//                   iconSize: 15,
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       const Color(0xffAE8D2F),
//                     ),
//                   ),
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.notifications,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             electionProvider.upcomingElections.isNotEmpty
//                 ? Election(
//                     title: 'Upcoming elections',
//                     description:
//                         'Exercise your right to vote in the upcoming election within the Babcock University community.',
//                     elections: electionProvider.upcomingElections,
//                   )
//                 : const NoElection(
//                     title: 'No elections coming up.',
//                     description:
//                         'Stay tuned for upcoming election announcements.',
//                   ),
//             const SizedBox(
//               height: 20,
//             ),
//             electionProvider.ongoingElections.isNotEmpty
//                 ? Election(
//                     title: 'Ongoing elections',
//                     description:
//                         'Exercise your right to vote in the ongoing election within the Babcock University community.',
//                     elections: ongoingElections,
//                   )
//                 : const NoElection(
//                     title: 'No elections ongoing.',
//                     description:
//                         'Stay tuned for ongoing election announcements.',
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/election_provider.dart';
import '../widgets/election.dart';
import '../widgets/no_election.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? user = Provider.of<UserProvider>(context).user;
    final electionProvider = Provider.of<ElectionProvider>(context);

    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${user?.displayName}!',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'What do you want to do today?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  iconSize: 15,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffAE8D2F)),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            electionProvider.upcomingElections.isNotEmpty
                ? Election(
                    title: 'Upcoming elections',
                    description:
                        'Exercise your right to vote in the upcoming election within the Babcock University community.',
                    elections: electionProvider.upcomingElections,
                  )
                : const NoElection(
                    title: 'No elections coming up.',
                    description:
                        'Stay tuned for upcoming election announcements.',
                  ),
            const SizedBox(height: 20),
            electionProvider.ongoingElections.isNotEmpty
                ? Election(
                    title: 'Ongoing elections',
                    description:
                        'Exercise your right to vote in the ongoing election within the Babcock University community.',
                    elections: electionProvider.ongoingElections,
                  )
                : const NoElection(
                    title: 'No elections ongoing.',
                    description:
                        'Stay tuned for ongoing election announcements.',
                  ),
          ],
        ),
      ),
    );
  }
}
