import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../page_unloggin/main_page_unloggin.dart';

class MainPageLogged extends StatefulWidget {
  const MainPageLogged({super.key});

  @override
  State<MainPageLogged> createState() => _MainPageLoggedState();
}

class _MainPageLoggedState extends State<MainPageLogged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Container(
            child: ElevatedButton(
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => route.isFirst); // Quay về màn hình chính
                // FirebaseAuth.instance.signOut();
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => MainPageUnLoggin()),
                // );
                // print('Log Out Sucesful!');
              },
              child: Text("Log Out"),
            ),
          ),
        ),
      ),
    );
  }
}
