import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopee/page_unloggin/profile_page/register.dart';

import '../main_page.dart';
import 'forgot_password.dart';
import 'login_seller.dart';

class Login extends StatefulWidget {
  final VoidCallback? onLoggedIn;
  final bool needBackToMainPage;

  const Login({super.key, this.needBackToMainPage = false, this.onLoggedIn});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (widget.onLoggedIn != null) {
        widget.onLoggedIn!();
      }

      if (widget.needBackToMainPage) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainPage()),
          (route) => false,
        );
      } else {
        Navigator.pop(context);
      }
      debugPrint('Login successful!');
    } catch (e) {
      debugPrint('Error during login: $e');
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 217, 217, 1),
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                  _buildFormUserName(),
                  SizedBox(height: 10),
                  _buildFormPassword(),
                  SizedBox(height: 15),
                  _buildButtonLogin(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Đăng nhập bằng SMS',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
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
                  SizedBox(height: 10),
                  _buildButtonLoginWithGG(),
                  SizedBox(height: 15),
                  _buildButtonLoginWithFB(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: Color.fromRGBO(214, 217, 217, 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bạn chưa có tài khoản ?", style: TextStyle(fontSize: 16)),
          TextButton(
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
              'Đăng ký ngay ',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormUserName() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email/Số điện thoại',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: FaIcon(FontAwesomeIcons.user),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormPassword() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            obscureText: _isObscure,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Mật khẩu',
              prefixIcon: Padding(
                padding: EdgeInsets.all(8),
                child: FaIcon(FontAwesomeIcons.lock),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Color.fromRGBO(214, 217, 217, 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
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
    );
  }

  Widget _buildButtonLogin() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(214, 217, 217, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: signIn,
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
    );
  }

  Widget _buildButtonLoginWithGG() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(214, 217, 217, 1)),
      ),
      child: InkWell(
        onTap: () {
          print("Đăng nhập Google !");
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
                  "Tiếp tục với Google",
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
    );
  }

  Widget _buildButtonLoginWithFB() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(214, 217, 217, 1)),
      ),
      child: InkWell(
        onTap: () {
          print("Đăng nhập Facebook !");
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
                  "Tiếp tục với Facebook",
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
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.orange, size: 40),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        'Đăng nhập',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 15),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Login_Seller();
                },
              ),
            );
          },
          icon: FaIcon(FontAwesomeIcons.store, size: 30),
        ),
        IconButton(
          onPressed: () {
            print('Click IconButton Circle Question');
          },
          padding: EdgeInsets.only(right: 15),
          icon: FaIcon(FontAwesomeIcons.circleQuestion, size: 30),
        ),
      ],
    );
  }
}
