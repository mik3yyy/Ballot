import 'package:ballot/global_comonents/myMessageHandler.dart';
import 'package:ballot/model/election.dart';
import 'package:ballot/model/option.dart';
import 'package:ballot/model/position.dart';
import 'package:ballot/model/vote.dart';
import 'package:ballot/provider/election_provider.dart';
import 'package:ballot/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'summary_screen.dart'; // Import your SummaryScreen

class VotingScreen extends StatefulWidget {
  final Position position;
  final Election election;
  final Vote? vote;

  const VotingScreen(
      {Key? key, required this.position, required this.election, this.vote})
      : super(key: key);

  @override
  _VotingScreenState createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int id = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  check() {
    if (widget.vote != null) {
      setState(() {
        id = widget.vote!.option_id;
      });
    }
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    final electionProvider = Provider.of<ElectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // title: Text('Vote for ${widget.postName}'),
        title: const Text('Back'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.position.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffAE8D2F),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.position.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Divider(color: Colors.grey, thickness: 1),
            Expanded(
              child: ListView.builder(
                itemCount: widget.position.options.length,
                itemBuilder: (context, index) {
                  Option option = widget.position.options[index];
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 3,
                                color: id == option.id
                                    ? Colors.green
                                    : Constants.white,
                              )),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(Constants.profile),
                            radius: 50,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(option.name, style: const TextStyle(fontSize: 18)),
                        Text(option.bio),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            electionProvider.addOrReplaceVote(Vote(
                                position_id: widget.position.id,
                                option_id: option.id,
                                postionName: widget.position.name,
                                optionName: option.name));
                            MyMessageHandler.showSnackBar(context,
                                "Voted ${option.name} for ${widget.position.name}",
                                option: options.success);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xff20448F),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 60),
                            child: const Text(
                              'Vote',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
