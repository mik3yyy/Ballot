import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// import 'event_screen.dart';
import 'Home Screen/home_screen.dart';
// import 'profile_screen.dart';
// import 'task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String id = '/home-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;

  // Method to select the widget based on the current index
  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
      // return EventScreen();
      // case 2:
      //   return TaskScreen();
      // case 3:
      //   return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getSelectedWidget(_currentIndex),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          backgroundColor: const Color(0xffAE8D2F),
          unselectedItemColor: Colors.white,
          curve: Curves.bounceOut,
          itemShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.white,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.event_note),
              title: const Text("Events"),
              selectedColor: Colors.white,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.format_list_bulleted),
              title: const Text("Tasks"),
              selectedColor: Colors.white,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
