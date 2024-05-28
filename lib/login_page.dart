import 'package:ap_project_frontend/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _usernameEmpty = false;
  bool _passEmpty = false;
  bool _passValid = true;
  bool _obscured = true;




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,

        child: Builder(
            builder: (context) {
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
                          Column(
                            children: [
                              Image.asset("assets/images/user.png",
                                  width: 100, height: 100),

                              const SizedBox(
                                height: 30,
                              ),

                              const Text(
                                "ورود به پنل کاربری",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Vazir",
                                    color: Colors.pink),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              TextField(
                                controller: _username,

                                decoration: InputDecoration(
                                    hintText: "نام کاربری",

                                    hintStyle: const TextStyle(
                                        fontFamily: "Vazir",
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(30, 30, 30, 0.8)
                                    ),

                                    errorText: _usernameEmpty ? "نام کاربری خود را وارد کنید!" : null,

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

                              const SizedBox(height: 20),

                              TextField(
                                controller: _password,

                                decoration: InputDecoration(
                                  hintText: "کلمه عبور",

                                  hintStyle: const TextStyle(
                                      fontFamily: "Vazir",
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(30, 30, 30, 0.8)
                                  ),

                                  errorText: _passEmpty ? "رمز عبور خود را وارد کنید!" : (_passValid ? null : "رمز عبور اشتباه است!"),

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
                                      child: Icon(
                                          _obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded
                                      ),

                                    ),
                                  )
                                ),
                                obscureText: _obscured,
                              ),

                              const SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _username.text.isEmpty ? _usernameEmpty = true : _usernameEmpty = false;

                                    _password.text.isEmpty ? _passEmpty = true : _passEmpty = false;

                                    if (!_usernameEmpty && !_passEmpty) {
                                      if (passValidation(_password)) {
                                        _passValid = true;
                                      }
                                      else {
                                        _passValid = false;
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
                                  style: TextStyle(fontSize: 20, fontFamily: "Vazir"),
                                ),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "حساب کاربری ندارید؟ ",
                                style: TextStyle(
                                    fontFamily: "Vazir",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const SignupPage()
                                        )
                                    );
                                  },
                                  child: const Text("ثبت نام",
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17)
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  bool passValidation(TextEditingController password) {
    return false;
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }
}

