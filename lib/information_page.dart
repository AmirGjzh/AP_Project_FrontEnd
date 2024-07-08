import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/login_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passController = TextEditingController();
  final _newPassController1 = TextEditingController();
  final _newPassController2 = TextEditingController();
  bool _obscured1 = true;
  bool _obscured2 = true;
  bool _obscured3 = true;

  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(fontFamily: "Vazir", fontSize: 15, fontWeight: FontWeight.bold))),
      scaffoldMessengerKey: _messengerKey,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: _appBar(context),
                toolbarHeight: 235,
                backgroundColor: Colors.pink,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              body: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    _info(context),
                    const SizedBox(
                      height: 25,
                    ),
                    _changeInfo(context),
                    const SizedBox(
                      height: 25,
                    ),
                    _deleteAccountButton(context)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _appBar(context) {
    return Center(
      child: Column(children: [
        Row(
          children: [
            InkWell(
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 30,
              ),
              onTap: () async {
                await User.homePageReady();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            const Spacer(),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade200,
              child: const CircleAvatar(
                radius: 65,
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 4),
                        color: Colors.black.withOpacity(
                          0.3,
                        ),
                        blurRadius: 3,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    child: Icon(Icons.add_a_photo, color: Colors.pink.shade800),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "${User.user!.name} ${User.user!.lastname}",
          style: const TextStyle(
            fontFamily: "Vazir",
            fontSize: 16,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  _info(context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade50,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Student ID",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Vazir",
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  User.user!.id,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "Vazir",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black38,
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  "Semester",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Vazir",
                  ),
                ),
                Spacer(),
                Text(
                  "Spring 1402 - 1403",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Vazir",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black38,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  "Units",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Vazir",
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  User.user!.units,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "Vazir",
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black38,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  "Average",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Vazir",
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  User.average,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "Vazir",
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _changeInfo(context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade50,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.pink.shade50,
                            context: context,
                            builder: (BuildContext context) {
                              return _changeInfo2(context);
                            });
                      },
                      label: const Text("Edit information",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Vazir",
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.lock),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.pink.shade50,
                            context: context,
                            builder: (BuildContext context) {
                              return _changeInfo3(context);
                            });
                      },
                      label: const Text("Change password",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Vazir",
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade100,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _changeInfo2(context) {
    return Directionality(
        textDirection: TextDirection.ltr,
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
                      "New name :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Stack(children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
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
                      "New lastname :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Stack(children: [
                          TextField(
                            controller: _lastnameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
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
                        if (_nameController.text.isNotEmpty) {
                          User.user!.name = _nameController.text;
                          _nameController.text = "";
                          await User.updateName();
                        }
                        if (_lastnameController.text.isNotEmpty) {
                          User.user!.lastname = _lastnameController.text;
                          _lastnameController.text = "";
                          await User.updateLastname();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Record changes",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _changeInfo3(context) {
    return Directionality(
        textDirection: TextDirection.ltr,
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
                      "Current password :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Stack(children: [
                          TextField(
                            controller: _passController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured1,
                                    child: Icon(_obscured1
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded),
                                  ),
                                )),
                            obscureText: _obscured1,
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
                      "New password :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Stack(children: [
                          TextField(
                            controller: _newPassController1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured2,
                                    child: Icon(_obscured2
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded),
                                  ),
                                )),
                            obscureText: _obscured2,
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
                      "Confirm password :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: "Vazir",
                      ),
                    ),
                    const Spacer(),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Stack(children: [
                          TextField(
                            controller: _newPassController2,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured3,
                                    child: Icon(_obscured3
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded),
                                  ),
                                )),
                            obscureText: _obscured3,
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
                        if (_passController.text.isEmpty) {
                          _showTopSnackBar(
                              context, "Please enter current password!");
                        } else if (_newPassController1.text.isEmpty) {
                          _showTopSnackBar(
                              context, "Please enter new password!");
                        } else if (_newPassController2.text.isEmpty) {
                          _showTopSnackBar(
                              context, "Please confirm new password!");
                        } else if (!_currentPassValid(_passController.text)) {
                          _showTopSnackBar(context, "Wrong current password!");
                          _passController.text = "";
                        } else if (!_passValidation(
                            _newPassController1.text, User.user!.id)) {
                          _showTopSnackBar(
                              context, "Choose a better password!");
                          _newPassController1.text = "";
                          _newPassController2.text = "";
                        } else if (_newPassController1.text !=
                            _newPassController2.text) {
                          _showTopSnackBar(context, "Passwords don't match!");
                          _newPassController2.text = "";
                        } else {
                          User.user!.password = _newPassController1.text;
                          await User.updatePassword();
                          _passController.text = "";
                          _newPassController1.text = "";
                          _newPassController2.text = "";
                          _showTopSnackBar(
                              context, "Password changed successfully!");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Record changes",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  _deleteAccountButton(context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(35),
      child: SizedBox(
        width: 350,
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Are you sure you want to delete your",
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "account?",
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          Row(
                            children: [
                              Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                        child: Text("No",
                                            style: TextStyle(
                                                fontFamily: "Vazir",
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                child: TextButton(
                                  onPressed: () async {
                                    await User.removeStudent();

                                    User.removeStudent();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                        child: Text("Yes",
                                            style: TextStyle(
                                                fontFamily: "Vazir",
                                                color: Colors.pink,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
            });
          },
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white),
          child: const Text(
            "Delete account",
            style: TextStyle(
                fontSize: 15, fontFamily: "Vazir", fontWeight: FontWeight.bold),
          ),
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

  void _toggleObscured3() {
    setState(() {
      _obscured3 = !_obscured3;
    });
  }

  bool _passValidation(String password, String id) {
    var pattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return pattern.hasMatch(password) && !password.contains(id);
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
        margin: const EdgeInsets.only(bottom: 410, right: 20, left: 20),
        action: SnackBarAction(
          onPressed: () {},
          label: "Ok",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  bool _currentPassValid(String pass) {
    return pass == User.user!.password;
  }
}
