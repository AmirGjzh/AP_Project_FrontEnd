import 'package:ap_project_frontend/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,

        child: Scaffold(
          body: SingleChildScrollView(
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
                        decoration: InputDecoration(
                            hintText: "نام کاربری",
                            hintStyle: const TextStyle(
                              fontFamily: "Vazir",
                              fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(30, 30, 30, 0.8)
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
                        decoration: InputDecoration(
                          hintText: "کلمه عبور",
                          hintStyle: const TextStyle(
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(30, 30, 30, 0.8)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          fillColor: Colors.pink.withOpacity(0.2),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
            
                      const SizedBox(height: 20),
            
                      ElevatedButton(
                        onPressed: () {
                          // TODO
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
                            fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            runApp(const SignupPage());
                          },
                          child: const Text("ثبت نام",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
