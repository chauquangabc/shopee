import 'package:flutter/material.dart';

class IntroductionVersion extends StatelessWidget {
  const IntroductionVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(237, 78, 46, 1),
          size: 40,
        ),
        backgroundColor: Colors.white,
        title: Text('Giới thiệu', style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(214, 217, 217, 1),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: 300,
              child: Image.asset('assets/shopee_logo.png'),
            ),
            Text(
              'Shopee',
              style: TextStyle(
                color: Color.fromRGBO(237, 78, 46, 1),
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('v1.0.1',style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
