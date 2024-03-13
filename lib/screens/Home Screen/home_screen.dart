import 'package:ballot/model/election.dart';
import 'package:ballot/screens/Election%20Screen/election_screen.dart';
import 'package:ballot/screens/Home%20Screen/home_function.dart';
import 'package:ballot/settings/hive.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:redacted/redacted.dart';

import '../../provider/election_provider.dart';
import '../../widgets/election.dart';
import '../../widgets/no_election.dart';
import '../../model/user_model.dart';
import '../../provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeFunction.getData(context: context);
    HomeFunction.getUserData(context: context);
  }

  Color _getColorForIndex(int index) {
    const List<Color> colors = [
      Color(0xff7C4236), // First color
      Color(0xff209276), // Second color
      Color(0xff455A64), // Third color
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    print(HiveFunction.getToken());
    UserModel? user = HiveFunction.getUser();
    final electionProvider = Provider.of<ElectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Hi ${user.displayName}'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElectionWidget(
              title: 'Upcoming elections',
              description:
                  'Exercise your right to vote in the upcoming election within the Babcock University community.',
            ),
            Gap(10),
            if (electionProvider.upcomingElections == null) ...[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _getColorForIndex(0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 50,
                            width: 50,
                            // child: ClipOval(child: Icon(Icons.)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "dl;fmlp",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'dgg',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ).redact(context);
                  },
                  itemCount: 3,
                ),
              )
            ] else if (electionProvider.upcomingElections!.isEmpty) ...[
              const NoElection(
                title: 'No elections coming up.',
                description: 'Stay tuned for upcoming election announcements.',
              ),
            ] else if (electionProvider.upcomingElections!.isNotEmpty) ...[
              Expanded(
                // height:/ 400,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Election election =
                        electionProvider.upcomingElections![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ElectionScreen(electionData: election)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _getColorForIndex(index),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipOval(child: Icon(Icons.elderly)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    election.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    election.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: electionProvider.upcomingElections?.length ?? 3,
                ),
              )
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
