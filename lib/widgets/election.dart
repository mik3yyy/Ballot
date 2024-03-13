// import 'package:ballot/screens/election_screen.dart';
// import 'package:flutter/material.dart';
// class Election extends StatelessWidget {
//   const Election({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.elections,
//   });
//   final String title;
//   final String description;
//   final List<Map> elections;
// Color _getColorForIndex(int index) {
//   const List<Color> colors = [
//     Color(0xff7C4236), // First color
//     Color(0xff209276), // Second color
//     Color(0xff455A64), // Third color
//   ];
//   return colors[index % colors.length];
// }
//   _navigateToNextScreen(Map e, context) {
//     if (e['type'] == 'ongoing') {
//       Navigator.pushNamed(context, ElectionScreen.id);
//     }
//     // return Container();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Color(0xffAE8D2F),
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(description),
//         ...elections.asMap().entries.map((entry) {
//           int index = entry.key;
//           Map e = entry.value;
//           return Container(
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.symmetric(vertical: 10),
//             decoration: BoxDecoration(
//               color: _getColorForIndex(index),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: 50,
//                   child: ClipOval(
//                     child: Image.network(
//                       e['icon_link'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         e['title'],
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         e['description'],
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _navigateToNextScreen(e, context);
//                   },
//                   icon: const Icon(
//                     Icons.navigate_next,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ballot/screens/election_screen.dart';

class ElectionWidget extends StatelessWidget {
  final String title;
  final String description;

  const ElectionWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  Color _getColorForIndex(int index) {
    const List<Color> colors = [
      Color(0xff7C4236),
      Color(0xff209276),
      Color(0xff455A64),
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xffAE8D2F),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(description),
        // ...electionWidgets.map((electionWidget) {
        //   int index = elections.indexOf(election);
        //   return Container();
        // }).toList(),
      ],
    );
  }
}
