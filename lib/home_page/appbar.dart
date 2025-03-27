import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile_page/login.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Color.fromRGBO(237, 78, 46, 1),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('Av');
                      },
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass))
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () {
                      print('Click cartShopping');
                    },
                        icon: FaIcon(
                          FontAwesomeIcons.cartShopping, color: Colors.white,)),
                    IconButton(onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.solidMessage, color: Colors.white,))
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
