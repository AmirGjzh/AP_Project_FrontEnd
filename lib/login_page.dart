import 'dart:convert';
import 'dart:io';

import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/signup_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String state = "";
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscured = true;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 15,
                  fontWeight: FontWeight.bold))),
      scaffoldMessengerKey: _messengerKey,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: Colors.pink.withOpacity(0.03),
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  margin: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _header(context),
                      _inputPart(context),
                      _signupSwitch(context)
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
          "Login",
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
                hintText: "Student ID",
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
            controller: _passwordController,
            decoration: InputDecoration(
                hintText: "Password",
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured,
                    child: Icon(_obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured,
          ),
        ),
        const SizedBox(height: 20),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(35),
          child: ElevatedButton(
            onPressed: () async {
              if (_idController.text.isEmpty) {
                _showSnackBar(context, "Please enter you're ID!");
              } else if (_passwordController.text.isEmpty) {
                _showSnackBar(context, "Please enter you're password!");
              } else {
                await _loginState(_idController.text, _passwordController.text);
                switch (state.split("-")[0]) {
                  case "1":
                    await User.setUser(state.split("-")[1], state.split("-")[2],
                        _idController.text, _passwordController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Information()));
                    break;
                  case "2":
                    _showSnackBar(context, "Wrong password!");
                    break;
                  case "3":
                    _showSnackBar(context, "ID not found!");
                    break;
                  case "":
                    break;
                }
              }
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white),
            child: const Text(
              "Login",
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

  _signupSwitch(context) {
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
          children: [
            const Spacer(),
            const Text(
              "Don't have an account?  ",
              style: TextStyle(
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignupPage()));
                },
                child: const Text("Signup",
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14))),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
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
          label: "Ok",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  _loginState(String id, String password) async {
    Socket socket = await Socket.connect(User.IP, 1384);
    socket.write("login-$id-$password\u0000");
    socket.flush();
    await socket.listen((answer) async {
      setState(() {
        state = utf8.decode(answer.sublist(2));
        print("---- $state ----");
      });
    }).asFuture();
  }
}
