import 'package:flutter/material.dart';
import 'package:hotstar_api/controllers/navbar_controller.dart';
import 'package:hotstar_api/views/screens/download_screen.dart';
import 'package:hotstar_api/views/screens/profile_screen.dart';
import 'package:hotstar_api/views/screens/search_screen.dart';
import 'package:hotstar_api/views/screens/spark_screen.dart' ;
import 'package:provider/provider.dart';
import 'home_screen.dart';

class NavigationBarScreen extends StatelessWidget {
   NavigationBarScreen({super.key});

  final screens = [
    const HomeScreen(),
    const SearchScreen(), 
    const SparksScreen(),
    const DownloadScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, value, child) {
        return Scaffold(
          body: screens[value.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.currentIndex,
            type: BottomNavigationBarType.fixed,

            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,

            onTap: (index) {
              value.changeTab(index);
            },

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_camera_front_outlined),
                label: "Sparks",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_download_outlined),
                label: "Downloads",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "My Space",
              ),
            ],
          ),
        );
      },
    );
  }
}
