// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:task1/screens/login.dart';
import 'package:task1/screens/nav_bar_pages/categories_screens.dart';
import 'package:task1/screens/nav_bar_pages/main_screen.dart';
import 'package:task1/screens/nav_bar_pages/setting_screen.dart';

class HomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const HomePage.HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    Categories(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
      ]),
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.exit_to_app),
                    Text("Sing Out"),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
