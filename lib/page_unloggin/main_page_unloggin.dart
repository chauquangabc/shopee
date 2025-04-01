import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_page/profile_screen.dart';
import 'home_page/body_home_page/body_main_page.dart';
class MainPageUnLoggin extends StatefulWidget {
  const MainPageUnLoggin({super.key});

  @override
  State<MainPageUnLoggin> createState() => _MainPageUnLogginState();
}

class _MainPageUnLogginState extends State<MainPageUnLoggin> {
  List<Widget> _page = [];
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    _page = [
      HomeScreen(),
      Container(color: Colors.grey,),
      ProfileScreen()
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
