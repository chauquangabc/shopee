import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shopee/page_unloggin/profile_page/register.dart';

import 'intro_version_screen.dart';
import 'profile_screen_logged.dart';
import 'login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (user == null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(237, 78, 46, 1),
              flexibleSpace: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15, bottom: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {

                    },
                    icon: FaIcon(FontAwesomeIcons.user, color: Colors.orange),
                  ),
                ),
              ),
              actions: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Login(needBackToMainPage: true,onLoggedIn: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },),
                        ),
                      );


                    },

                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 39,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 78, 46, 1),
                    border: Border.all(color: Colors.white),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            body: Container(
              color: Color.fromRGBO(214, 217, 217, 1),
              child: Column(
                children: [
                  _buildExpanded1(context),
                  SizedBox(height: 10),
                  _buildExpanded2(context),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Hỗ trợ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circleQuestion,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Trung tâm trợ giúp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            height: 1,
                            color: Colors.grey,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                            },
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.comment,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Trò chuyện',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            height: 1,
                            color: Colors.grey,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IntroductionVersion(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.blog,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Giới thiệu',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            height: 1,
                            color: Colors.grey,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.gear,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Cài đặt',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                FaIcon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return ProfileScreenLogged();
        }
      },
    );
  }

  Widget _buildExpanded1(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Đơn mua',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // Chỉ chiếm diện tích theo nội dung
                    children: [
                      Text(
                        'Xem lịch sử mua hàng',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      // Khoảng cách giữa text và icon
                      FaIcon(
                        FontAwesomeIcons.angleRight,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.all(5),
                            ),
                            onPressed: () {
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Remix.inbox_archive_line,
                                  color: Colors.black,
                                  size: 50,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Chờ xác nhận',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.all(5),
                            ),
                            onPressed: () {
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Remix.archive_line,
                                  color: Colors.black,
                                  size: 50,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Chờ lấy hàng',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.all(5),
                            ),
                            onPressed: () {
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Remix.truck_line,
                                  size: 50,
                                  color: Colors.black,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Chờ giao hàng',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.all(5),
                            ),
                            onPressed: () {
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Remix.star_half_line,
                                  color: Colors.black,
                                  size: 50,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Đánh giá',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpanded2(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Ưu đãi dành riêng cho bạn ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/sale.png', scale: 3),
                              Text(
                                'Đơn đầu tiên',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Miễn phí',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  'assets/sp_cheapest.png',
                                  scale: 3,
                                ),
                              ),
                              SizedBox(height: 9),
                              Text(
                                'Shopee',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Siêu rẻ',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {

                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Image.asset(
                                  'assets/img_discount.png',
                                  scale: 5,
                                ),
                              ),
                              Text('Mã', style: TextStyle(color: Colors.black)),
                              Text(
                                "giảm giá",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {

                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Image.asset(
                                  'assets/img_freeDelivery.png',
                                  scale: 7,
                                ),
                              ),
                              Text(
                                'Miễn phí',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "vận chuyển",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
