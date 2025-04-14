import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopee/page_logged/profile/profile_screen_logged.dart';

import 'home_screen_logged/home_screen_logged.dart';


class MainPageLogged extends StatefulWidget {
  const MainPageLogged({super.key});

  @override
  State<MainPageLogged> createState() => _MainPageLoggedState();
}

class _MainPageLoggedState extends State<MainPageLogged> {

  List<Widget> _page = [];
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    _page = [
      HomeScreenLogged(),
      Container(color: Colors.grey,),
      ProfileScreenLogged()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseMedical),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shop),
            label: 'Mall',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Tôi',
          ),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
