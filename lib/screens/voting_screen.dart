import 'package:flutter/material.dart';
import 'summary_screen.dart'; // Import your SummaryScreen

class VotingScreen extends StatefulWidget {
  final String electionTitle;
  final List<Map<String, dynamic>> allPosts;
  final String postName;
  final List candidates;
  final String electionDescription;
  final Map<String, String> votes;

  const VotingScreen({
    Key? key,
    required this.electionTitle,
    required this.allPosts,
    required this.postName,
    required this.candidates,
    required this.electionDescription,
    required this.votes,
  }) : super(key: key);

  @override
  _VotingScreenState createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  void _voteForCandidate(String candidateName) {
    setState(() {
      widget.votes[widget.postName] = candidateName;
    });

    // Find the next post that hasn't been voted on yet
    Map<String, dynamic>? nextPost = widget.allPosts.firstWhere(
      (post) => !widget.votes.containsKey(post.keys.first),
      orElse: () => {}, // Return an empty map instead of null
    );

    if (nextPost.isNotEmpty) {
      // Navigate to the next VotingScreen for the next post
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VotingScreen(
            electionTitle: widget.electionTitle,
            allPosts: widget.allPosts,
            postName: nextPost.keys.first,
            candidates: nextPost.values.first,
            electionDescription: widget.electionDescription,
            votes: widget.votes,
          ),
        ),
      );
    } else {
      // All posts have been voted on, navigate to SummaryScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(
            electionName: widget.electionTitle,
            electionDescription:
                widget.electionDescription, // Make sure this is available
            votes: widget.votes,
            allPosts: widget.allPosts,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              widget.postName,
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
              widget.electionDescription,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Divider(color: Colors.grey, thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.candidates.map<Widget>((candidate) {
                    return _buildCandidateTile(candidate);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCandidateTile(Map candidate) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            backgroundImage: NetworkImage(candidate['profile_pic']),
            radius: 50,
          ),
          const SizedBox(height: 8),
          Text(candidate['name'], style: const TextStyle(fontSize: 18)),
          Text(candidate['department']),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () => _voteForCandidate(candidate['name']),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff20448F),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
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
  }
}
