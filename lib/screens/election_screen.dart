// // // import 'package:flutter/material.dart';
// // // class ElectionScreen extends StatelessWidget {
// // //   const ElectionScreen({super.key});
// // //   static String id = '/election-screen';
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Back'),
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //       ),
// // //       body: Container(
// // //         color: Colors.white,
// // //         margin: const EdgeInsets.only(
// // //           left: 30,
// // //           right: 30,
// // //           top: 20,
// // //         ),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               'Your Vote is secure, your Vote counts',
// // //               style: TextStyle(
// // //                 fontSize: 24,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               height: 10,
// // //             ),
// // //             Text(
// // //               'What do you want to do today?',
// // //               style: TextStyle(
// // //                 fontSize: 16,
// // //                 fontWeight: FontWeight.w300,
// // //               ),
// // //             ),
// // //             SizedBox(
// // //               height: 10,
// // //             ),
// // //             Divider(
// // //               color: Colors.grey,
// // //               thickness: 1,
// // //             ),
// // //             SizedBox(
// // //               height: 10,
// // //             ),
// // //             SingleChildScrollView(
// // //               child: Column(
// // //                 children: [
// // //                 ],
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // class ElectionScreen extends StatelessWidget {
// //   final Map<dynamic, dynamic> electionData;

// //   const ElectionScreen({
// //     Key? key,
// //     required this.electionData,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Election Details'),
// //         backgroundColor: Colors.blue,
// //         elevation: 0,
// //       ),
// //       body: Container(
// //         color: Colors.white,
// //         margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               electionData['title'] ?? 'Election',
// //               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 10),
// //             Text(
// //               electionData['description'] ?? 'Description not available',
// //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
// //             ),
// //             const SizedBox(height: 10),
// //             const Divider(color: Colors.grey, thickness: 1),
// //             const SizedBox(height: 20),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: _buildElectionDetails(electionData),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List<Widget> _buildElectionDetails(Map<dynamic, dynamic> data) {
// //     // Example of how to build election details
// //     // Modify this to suit the data structure of your election data
// //     List<Widget> widgets = [];

// //     if (data.containsKey('candidates')) {
// //       List candidates = data['candidates'];
// //       for (var candidate in candidates) {
// //         widgets.add(Padding(
// //           padding: const EdgeInsets.only(bottom: 10),
// //           child: Text(
// //             candidate['name'] ?? 'Unknown',
// //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// //           ),
// //         ));
// //       }
// //     } else {
// //       widgets.add(const Text('No candidates information available'));
// //     }

// //     return widgets;
// //   }
// // }

// import 'package:ballot/screens/voting_screen.dart';
// import 'package:flutter/material.dart';

// class ElectionScreen extends StatelessWidget {
//   final Map<dynamic, dynamic> electionData;

//   const ElectionScreen({Key? key, required this.electionData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Back'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.white,
//         margin: const EdgeInsets.symmetric(
//           horizontal: 30,
//           vertical: 20,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Your Vote is secure, your Vote counts',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               'What do you want to do today?',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Divider(
//               color: Colors.grey,
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               electionData['title'] ?? 'Election',
//               style: const TextStyle(
//                 color: Color(0xffAE8D2F),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               electionData['description'] ?? 'Description not available',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: _buildPosts(electionData, context),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildPosts(Map<dynamic, dynamic> data, BuildContext context) {
//     List<Widget> postWidgets = [];
//     if (data.containsKey('posts')) {
//       List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(data['posts'].map((post) => Map<String, dynamic>.from(post)));

//       for (var post in posts) {
//         post.forEach((postName, candidates) {
//           String electionName = data['title']
//               .split(' ')[0]; // Get first word of the election title
//           postWidgets.add(
//             Container(
//               padding: const EdgeInsets.all(20),
//               margin: const EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 color: const Color(0xffAE8D2F),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           postName,
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           'Participate in the democratic process and select your future $electionName $postName.',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.navigate_next,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => VotingScreen(
//                             electionTitle: data['title'],
//                             allPosts: posts,
//                             postName: postName,
//                             candidates: candidates,
//                             electionDescription: data['description'],
//                             votes: {}, // Initialize an empty map for votes
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//       }
//     }
//     return postWidgets;
//   }
// }
