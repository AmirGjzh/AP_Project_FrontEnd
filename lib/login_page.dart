import 'package:ap_project_frontend/information.dart';
import 'package:ap_project_frontend/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _id = TextEditingController();
  final _password = TextEditingController();
  bool _idEmpty = false;
  bool _passEmpty = false;
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          "ورود به پنل کاربری",
          style: TextStyle(
              shadows: [
                Shadow(
                  offset: Offset(4, 4),
                  blurRadius: 1,
                  color: Colors.black12,
                ),
              ],
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
        Stack(children: [
          TextField(
            controller: _id,
            decoration: InputDecoration(
                hintText: "شماره دانشجویی",
                hintStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(30, 30, 30, 0.8),
                ),
                errorText: _idEmpty ? "شماره دانشجویی خود را وارد کنید!" : null,
                errorStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.pink.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 20,
                offset: Offset(
                  0,
                  1,
                ),
              )
            ], color: Colors.cyan),
          ),
        ]),
        const SizedBox(height: 20),
        Stack(children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 20,
                offset: Offset(
                  0,
                  1,
                ),
              )
            ], color: Colors.cyan),
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
                hintText: "کلمه عبور",
                hintStyle: const TextStyle(
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                errorText: _passEmpty ? "کلمه عبور خود را وارد کنید!" : null,
                errorStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.pink.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured,
                    child: Icon(_obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured,
          ),
        ]),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(
                0,
                1,
              ),
            )
          ]),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _id.text.isEmpty ? _idEmpty = true : _idEmpty = false;

                _password.text.isEmpty ? _passEmpty = true : _passEmpty = false;

                if (!_idEmpty && !_passEmpty) {
                  switch (_loginState(_id.text, _password.text)) {
                    case 1:
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Information()));
                      break;
                    case 2:
                      break;
                    case 3:
                      break;
                  }
                }
              });
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white),
            child: const Text(
              "ورود",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Vazir",
                shadows: [
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 1,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _signupSwitch(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade50,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 1),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "حساب کاربری ندارید؟ ",
            style: TextStyle(shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 1,
                color: Colors.black12,
              ),
            ], fontFamily: "Vazir", fontWeight: FontWeight.w600, fontSize: 17),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignupPage()));
              },
              child: const Text("ثبت نام",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 1,
                          color: Colors.black12,
                        ),
                      ],
                      color: Colors.pink,
                      fontWeight: FontWeight.w600,
                      fontSize: 17)))
        ],
      ),
    );
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  int _loginState(String username, String password) {
    return 1;
  }
}
