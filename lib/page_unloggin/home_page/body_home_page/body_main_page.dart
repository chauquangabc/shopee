import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../appbar.dart';
import 'body_component1.dart';
import 'body_component2.dart';
import 'body_component3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 217, 217, 1),
      appBar: CustomAppbar(),
      body: ListView(
        children: [
          Component1(),
          Component2(),
          Component3()
        ],
      ),
    );
  }
}
