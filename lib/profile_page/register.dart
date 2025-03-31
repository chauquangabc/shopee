import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopee/profile_page/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 217, 217, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange, size: 40),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Đăng ký',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Click IconButton Circle Question');
            },
            padding: EdgeInsets.only(right: 15),
            icon: FaIcon(FontAwesomeIcons.circleQuestion, size: 30),
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Transform.scale(
                scale: 0.7,
                child: Image.asset('assets/shopee_logo.png'),
              ),
            ), //Image logo shopee
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Số điện thoại',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: FaIcon(FontAwesomeIcons.user),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              //Password
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Mật khẩu',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: FaIcon(FontAwesomeIcons.lock),
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 1,
                                          color: Color.fromRGBO(
                                            214,
                                            217,
                                            217,
                                            1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Hãy nhập mật khẩu';
                                    }
                                    if (value.length < 6) {
                                      return 'Password phải từ 6 kí tự trở lên';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(214, 217, 217, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('Register');
                              },
                              child: Center(
                                child: Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 80,
                            color: Color.fromRGBO(214, 217, 217, 1),
                          ),
                          SizedBox(width: 5),
                          Text('Hoặc', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 5),
                          Container(
                            height: 1,
                            width: 80,
                            color: Color.fromRGBO(214, 217, 217, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(214, 217, 217, 1),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Đăng ký bằng Google !");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/img_google.png'),
                              // child: FaIcon(
                              //   FontAwesomeIcons.google,
                              //   color: Color(0xFF4285F4),
                              // ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Đăng ký bằng Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(214, 217, 217, 1),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Đăng ký bằng Facebook !");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('assets/img_facebook.png'),
                              // padding: const EdgeInsets.all(8.0),
                              // child: FaIcon(
                              //   FontAwesomeIcons.facebook,
                              //   color: Color(0xFF4285F4),
                              // ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Đăng ký bằng Facebook",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(), // Đẩy phần tử cuối cùng xuống dưới
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 50,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text('Bằng việc đăng ký , bạn đã đồng ý với'),
                          Text(
                            'Điều khoản Dịch vụ & Chính sách Riêng tư của Shopee',
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(214, 217, 217, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bạn đã có tài khoản ?", style: TextStyle(fontSize: 16)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
              child: Text(
                'Đăng nhập ngay ',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
