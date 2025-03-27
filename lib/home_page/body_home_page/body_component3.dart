import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Component3 extends StatefulWidget {
  const Component3({super.key});

  @override
  State<Component3> createState() => _Component3State();
}

class _Component3State extends State<Component3> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('Abs'),
        );
      },
    );
  }
}
