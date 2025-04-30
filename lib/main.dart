import 'package:flutter/material.dart';
import 'Page/HomePage.dart';
import 'Page/History.dart';
import 'Page/Setting.dart';

void main() {
  runApp(Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext Context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _MainPage();
}

class _MainPage extends State<Page> {
  int SelectedIndex = 0;

  final List<Widget> HalamanPage = [
    MaterialApp(home: MyWidget(),debugShowCheckedModeBanner: false),
    MaterialApp(home: History(cart: []),debugShowCheckedModeBanner: false),
    MaterialApp(home: Setting(),debugShowCheckedModeBanner: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HalamanPage[SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        onTap: (index) {
          setState(() {
            SelectedIndex = index;
          });
        },
        backgroundColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.white),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

