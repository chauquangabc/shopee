import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        color: Color.fromRGBO(237, 78, 46, 1),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 10),
              width: 300,
              height: 60,
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
                          horizontal: 10, vertical: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('Find Product');
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
                    IconButton(
                        onPressed: () {
                      print('Click cartShopping');
                    },
                        icon: FaIcon(
                          size: 30,
                          FontAwesomeIcons.cartShopping, color: Colors.white,)),
                    IconButton(onPressed: () {},
                        icon: FaIcon(
                          size: 30,
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
