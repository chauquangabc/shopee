import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../page_logged/main_page_logged.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  var _autoValidMode = AutovalidateMode.disabled;

  bool checkPassword() {
    if (_passwordController.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future register() async {
    if (_autoValidMode == AutovalidateMode.disabled) {
      setState(() {
        _autoValidMode = AutovalidateMode.always;
      });
    }
    final isValid = _formKey.currentState?.validate() ?? false;
    try {
      if (checkPassword()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPageLogged()),
        );
        print('Register Succesful');
      } else {
        print('Bugggg');
      }
    } catch (e) {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/shopee_logo.png',scale: 4,),
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidMode,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email / Số điện thoại',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: FaIcon(FontAwesomeIcons.user),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập email hoặc số điện thoại';
                                    }
                                    final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                    ).hasMatch(value);
                                    final bool phoneValid = RegExp(
                                      r"^\d{9,15}$",
                                    ).hasMatch(value);
                                    if (!emailValid && !phoneValid) {
                                      return 'Tài khoản không hợp lệ! ';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: _isObscure1,
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
                                              _isObscure1 = !_isObscure1;
                                            });
                                          },
                                          icon: Icon(
                                            _isObscure1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập mật khẩu';
                                    } else if (value.length < 6) {
                                      return 'Mật khẩu không hợp lệ ';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: _isObscure2,
                                  controller: _confirmPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Xác nhận mật khẩu',
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
                                              _isObscure2 = !_isObscure2;
                                            });
                                          },
                                          icon: Icon(
                                            _isObscure2
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập mật khẩu';
                                    } else if (!checkPassword()) {
                                      return 'Mật khẩu chưa trùng khớp';
                                    } else {
                                      return null;
                                    }
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
                              onTap: register,
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
                    SizedBox(height: 20,),
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
            ],
          ),
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
