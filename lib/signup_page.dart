import 'package:ap_project_frontend/login_page.dart';
import 'package:ap_project_frontend/information.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _id = TextEditingController();
  final _password1 = TextEditingController();
  final _password2 = TextEditingController();
  bool _idEmpty = false;
  bool _pass1Empty = false;
  bool _pass2Empty = false;
  bool _idValid = true;
  bool _pass1Valid = true;
  bool _pass2Valid = true;
  bool _obscured1 = true;
  bool _obscured2 = true;

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
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                errorText: _idEmpty ? "شماره دانشجویی خود را وارد کنید!" : (_idValid ? null : "این شماره دانشجویی قبلا استفاده شده!"),
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
          TextField(
            controller: _password1,
            decoration: InputDecoration(
                hintText: "کلمه عبور",
                hintStyle: const TextStyle(
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                errorText: _pass1Empty
                    ? "کلمه عبور خود را وارد کنید!"
                    : (_pass1Valid ? null : "کلمه عبور بهتری انتخاب کنید!"),
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
                    onTap: _toggleObscured1,
                    child: Icon(_obscured1
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured1,
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
          TextField(
            controller: _password2,
            decoration: InputDecoration(
                hintText: "تکرار کلمه عبور",
                hintStyle: const TextStyle(
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(30, 30, 30, 0.8)),
                errorText: _pass2Empty
                    ? "کلمه عبور خود را وارد کنید!"
                    : (!_pass2Valid ? "مطابقت ندارد!" : null),
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
                    onTap: _toggleObscured2,
                    child: Icon(_obscured2
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                )),
            obscureText: _obscured2,
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

                _password1.text.isEmpty
                    ? _pass1Empty = true
                    : _pass1Empty = false;

                _password2.text.isEmpty
                    ? _pass2Empty = true
                    : _pass2Empty = false;

                if (!_idEmpty && !_pass1Empty && !_pass2Empty) {
                  _idValid = _idValidation(_id.text);

                  if (_idValid) {
                    _pass1Valid = passValidation(_password1, _id);

                    if (_pass1Valid) {
                      _pass2Valid = _password1.text == _password2.text;

                      if (_pass2Valid) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Information()));
                      }
                    }
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
              "ثبت نام",
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

  _loginPageSwitch(context) {
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
            "حساب کاربری دارید؟ ",
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("ورود",
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

  _idValidation(String id) {
    return true;
  }

  bool passValidation(
      TextEditingController password1, TextEditingController username) {
    var pattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

    return pattern.hasMatch(password1.text) &&
        !password1.text.contains(username.text);
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
}
