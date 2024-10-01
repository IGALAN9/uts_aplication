import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'package:flutter_group3/notification_screen/notification.dart';
import 'package:flutter_group3/plus_screen/plus.dart';
import 'package:flutter_group3/user_screen/user.dart';
import 'home_screen/home.dart';
import 'search_screen/search.dart';
import 'package:flutter_group3/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media Group 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      SearchScreen(goHome: _goHome),
      PlusScreen(goHome: _goHome),
      NotificationPage(),
      const UserScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Image.asset("assets/home.png", width: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/search.png", width: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset("assets/plus.png", width: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/bell.png", width: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Image.asset("assets/user.png", width: 30),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
