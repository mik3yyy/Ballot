const hallSenatorIconLink =
    'https://th.bing.com/th?id=OIP.ZjWGBPoRd-zD8247yg5nAgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2';

const electoralProfilePic =
    'https://th.bing.com/th/id/OIP.i32e9BPZhQ0c1rSuh9H1NwHaFK?w=229&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';

final List<Map<dynamic, dynamic>> upcomingElections = [
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

final List<Map<dynamic, dynamic>> ongoingElections = [
  {
    'title': 'Hall Senator',
    'description':
        'Participate in the democratic process by electing your Hall Senator. They\'ll be your voice in hall-related matters',
    'icon_link': hallSenatorIconLink,
    'type': 'ongoing',
    'candidates': [
      {
        'name': 'John Doe',
        'profile_pic': electoralProfilePic,
      },
      {
        'name': 'John Doe',
        'profile_pic': electoralProfilePic,
      },
      {
        'name': 'John Doe',
        'profile_pic': electoralProfilePic,
      },
    ],
  },
  {
    'title': 'President',
    'description':
        'Participate in the democratic process by electing your Hall Senator. They\'ll be your voice in hall-related matters',
    'icon_link': hallSenatorIconLink,
    'type': 'ongoing',
    'candidates': [
      {
        'name': 'James Doe',
        'profile_pic': electoralProfilePic,
      },
      {
        'name': 'John Doe',
        'profile_pic': electoralProfilePic,
      },
      {
        'name': 'James Doe',
        'profile_pic': electoralProfilePic,
      },
    ],
  },
];
