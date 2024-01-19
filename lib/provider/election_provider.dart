import 'package:ballot/screens/screen_constants.dart';
import 'package:flutter/foundation.dart';

class ElectionProvider with ChangeNotifier {
  List<Map<dynamic, dynamic>> _upcomingElections = [];
  List<Map<dynamic, dynamic>> _ongoingElections = [];

  ElectionProvider() {
    // Initialize with hardcoded data
    loadElections();
  }

  List<Map<dynamic, dynamic>> get upcomingElections => _upcomingElections;
  List<Map<dynamic, dynamic>> get ongoingElections => _ongoingElections;

  void loadElections() {
    // Replace these with your hardcoded data
    _upcomingElections = [
      {
        'title': 'Hall Senator',
        'description':
            'Participate in the democratic process by electing your Hall Senator. They\'ll be your voice in hall-related matters',
        'icon_link': hallSenatorIconLink,
        'type': 'upcoming',
      },
      {
        'title': 'Hall Senator',
        'description':
            'Participate in the democratic process by electing your Hall Senator. They\'ll be your voice in hall-related matters',
        'icon_link': hallSenatorIconLink,
        'type': 'upcoming',
      },
      {
        'title': 'Hall Senator',
        'description':
            'Participate in the democratic process by electing your Hall Senator. They\'ll be your voice in hall-related matters',
        'icon_link': hallSenatorIconLink,
        'type': 'upcoming',
      },
    ];
    _ongoingElections = [
      {
        'title': 'BUSA Election',
        'description':
            'Participate in the democratic process and have a say in your university\'s student association. Your vote matters',
        'icon_link': hallSenatorIconLink,
        'type': 'ongoing',
        'posts': [
          {
            'President': [
              {
                'name': 'John President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'Joe President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Information',
              },
              {
                'name': 'James President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Technology',
              },
            ]
          },
          {
            'Senate': [
              {
                'name': 'John Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'James Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'Joe Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
            ]
          },
          
        ],
      },
      {
        'title': 'BUCC Elections',
        'description':
            'Participate in the democratic process and have a say in BUCC\'s leadership and activities. Your vote counts!',
        'icon_link': hallSenatorIconLink,
        'type': 'ongoing',
        'posts': [
          {
            'President': [
              {
                'name': 'John President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'Joe President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'James President',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
            ]
          },
          {
            'Senate': [
              {
                'name': 'John Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'James Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
              {
                'name': 'Joe Senate',
                'profile_pic': electoralProfilePic,
                'department': 'Computer Science',
              },
            ]
          },
        ],
      },
    ];
    notifyListeners();
  }

  // Add other methods here as needed, e.g., for fetching from a backend
}
