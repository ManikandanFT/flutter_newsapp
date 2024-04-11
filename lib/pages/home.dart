import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../newscontroller/newscontroller.dart';
import 'homescreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Color _selectedColor = greencolor;
  Color _unselectedColor = Colors.black;
  final NewsController newsController = Get.put(NewsController());

  final List<Widget> _pages = [
    const Homebodyscreen(),
    const DiscoverPage(),
    const SavedPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Whitecolor,
      appBar: AppBar(
        backgroundColor: Whitecolor,
        title: Text(
          "ANTUVN",
          style: GoogleFonts.poppins(
            letterSpacing: -5,
            fontSize: screenWidth * 0.09,
            fontWeight: FontWeight.bold,
            color: greencolor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: screenHeight * 0.027,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: Transform.scale(
                    scale: 0.9,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_outlined, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: screenHeight * 0.027,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: Transform.scale(
                    scale: 0.9,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Whitecolor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _selectedColor,
        unselectedItemColor: _unselectedColor,

        onTap: ( int index) {
          setState(() {
            _currentIndex = index;
            _selectedColor = index == 0 ? Colors.green : Colors.black;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}








class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: const Center(
        child: Text('Discover Page'),
      ),
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: const Center(
        child: Text('Saved Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

