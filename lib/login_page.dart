import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            controller: _passwordController,
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
            onPressed: () {
              setState(() {
                if (_idController.text.isEmpty) {
                  _showSnackBar(context, "شماره دانشجویی خود را وارد کنید!");
                } else if (_passwordController.text.isEmpty) {
                  _showSnackBar(context, "کلمه عبور خود را وارد کنید!");
                } else {
                  switch (_loginState(_idController.text, _passwordController.text)) {
                    case 1:
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Information()));
                      break;
                    case 2:
                      _showSnackBar(context, "کلمه عبور اشتباه است!");
                      break;
                    case 3:
                      _showSnackBar(context, "شماره دانشجویی یافت نشد!");
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignupPage()));
                },

                child: const Text("ثبت نام",
                    style: TextStyle(

                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 17)))
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
          message, style: const TextStyle(fontFamily: "Vazir", fontSize: 15),),

        duration: const Duration(seconds: 2),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        action: SnackBarAction(
          onPressed: (){},
          label: "تایید",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  int _loginState(String username, String password) {
    // TODO
    return 1;
  }
}
