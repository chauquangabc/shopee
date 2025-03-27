import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_Seller extends StatelessWidget {
  const Login_Seller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 217, 217, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange, size: 40),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Đăng nhập',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
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
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Đăng nhập Tài khoản chính  / Tài khoản phụ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          Text("Dành cho người bán ")
                        ],
                      )
                    ),
                    SizedBox(height:15,),
                    Row(
                      children: [
                        //Email
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Tên tài khoản / Số điện thoại / Email',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FaIcon(FontAwesomeIcons.user),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        //Password
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                        border: UnderlineInputBorder(),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8),
                                child: FaIcon(FontAwesomeIcons.lock),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(FontAwesomeIcons.eye),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Color.fromRGBO(214, 217, 217, 1),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Quên ?',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 217, 217, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Đăng nhập !");
                        },
                        child: Center(
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ), ////Butt
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
