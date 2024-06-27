import 'dart:io';

import 'package:ap_project_frontend/login_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _idController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();

  bool _obscured1 = true;
  bool _obscured2 = true;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(fontFamily: "Vazir", fontSize: 15))),
      scaffoldMessengerKey: _messengerKey,

      home: Directionality(
        textDirection: TextDirection.rtl,

        child: Builder(builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),

                child: Container(
                  height: MediaQuery.of(context).size.height - 50,
                  margin: const EdgeInsets.all(25),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      _header(context),
                      _inputPart(context),
                      _loginPageSwitch(context)
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Image.asset("assets/images/user.png", width: 100, height: 100),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "ثبت نام",
          style: TextStyle(

              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Vazir",
              color: Colors.pink),
        ),
      ],
    );
  }

  _inputPart(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),

          child: TextField(
            controller: _idController,

            decoration: InputDecoration(
                hintText: "شماره دانشجویی",
                hintStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 0.8),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.pink.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
          ),
        ),
        const SizedBox(height: 20),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),

          child: TextField(
            controller: _passwordController1,

            decoration: InputDecoration(
                hintText: "کلمه عبور",
                hintStyle: const TextStyle(
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.pink.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured1,
                    child: Icon(_obscured1
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured1,
          ),
        ),
        const SizedBox(height: 20),
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),

          child: TextField(
            controller: _passwordController2,

            decoration: InputDecoration(
                hintText: "تکرار کلمه عبور",
                hintStyle: const TextStyle(
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.pink.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured2,
                    child: Icon(_obscured2
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured2,
          ),
        ),
        const SizedBox(height: 20),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(35),

          child: ElevatedButton(
            onPressed: () async {
                if (_idController.text.isEmpty) {
                  _showSnackBar(context, "شماره دانشجویی خود را وارد کنید!");
                } else if (_passwordController1.text.isEmpty) {
                  _showSnackBar(context, "کلمه عبور خود را وارد کنید!");
                } else if (_passwordController2.text.isEmpty) {
                  _showSnackBar(context, "تکرار کلمه عبور خود را وارد کنید!");
                } else if (_idValidation(_idController.text).toString() == "false") {
                  _showSnackBar(
                      context, "این شماره دانشجویی قبلا ثبت شده است!");
                } else if (!_passValidation(_passwordController1.text, _idController.text)) {
                  _showSnackBar(context, "کلمه عبور بهتری انتخاب کنید!");
                } else if (_passwordController1.text != _passwordController2.text) {
                  _showSnackBar(context, "کلمه عبور ها مطابقت ندارند!");
                } else {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.pink.shade50,
                      context: context,
                      builder: (BuildContext context) {
                        return _nameLastnameInput(context);
                      });
                }
            },

            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white),

            child: const Text(
              "ثبت نام",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Vazir",

              ),
            ),
          ),
        )
      ],
    );
  }

  _loginPageSwitch(context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),

      child: Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade50,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              "حساب کاربری دارید؟ ",
              style: TextStyle(

                  fontFamily: "Vazir",
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },

                child: const Text("ورود",
                    style: TextStyle(

                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 17)))
          ],
        ),
      ),
    );
  }

  void _toggleObscured1() {
    setState(() {
      _obscured1 = !_obscured1;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,

        content: Text(
          message,
          style: const TextStyle(fontFamily: "Vazir", fontSize: 15),
        ),

        duration: const Duration(seconds: 2),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        action: SnackBarAction(
          onPressed: () {},
          label: "تایید",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  void _showTopSnackBar(BuildContext context, String message) {
    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,

        content: Text(
          message,
          style: const TextStyle(fontFamily: "Vazir", fontSize: 15),
        ),

        duration: const Duration(seconds: 2),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        margin: const EdgeInsets.only(bottom: 330, right: 20, left: 20),

        action: SnackBarAction(
          onPressed: () {},
          label: "تایید",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  Future<String> _idValidation(String id) async {
    String validation = "";
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("newId-$id");
      serverSocket.flush();
      serverSocket.listen((answer) {
        setState(() {
          validation = (String.fromCharCode(answer as int) == "valid") ? "true" : "false";
        });
      });
    });
    return validation;
  }

  bool _passValidation(String password, String id) {
    var pattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return pattern.hasMatch(password) && !password.contains(id);
  }

  _nameLastnameInput(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                30, 30, 30, MediaQuery.of(context).viewInsets.bottom + 25),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  children: [
                    const Text(
                      "نام :",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Vazir",

                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),

                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Stack(children: [
                          TextField(
                            controller: _nameController,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.teal)),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Text(
                      "نام خانوادگی :",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Vazir",

                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),

                      child: SizedBox(
                        width: 200,
                        height: 60,

                        child: Stack(children: [
                          TextField(
                            controller: _lastnameController,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.teal)),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(35),

                  child: SizedBox(
                    width: 350,

                    child: ElevatedButton(
                      onPressed: () async {
                          if (_nameController.text.isEmpty) {
                            _showTopSnackBar(context, "نام خود را وارد کنید!");
                          } else if (_lastnameController.text.isEmpty) {
                            _showTopSnackBar(
                                context, "نام خانوادگی خود را وارد کنید!");
                          } else {
                            _signup(_idController.text, _passwordController1.text, _nameController.text,
                                _lastnameController.text);
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const Information()));
                          }
                      },

                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white),

                      child: const Text(
                        "ثبت نام",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Vazir",

                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _signup(String id, String password, String name, String lastname) async {
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("signup-$id-$password-$name-$lastname");
      serverSocket.flush();
    });
  }
}
