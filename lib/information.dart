import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String _name = "نام";
  String _lastname = "نام خانوادگی";
  String _id = "402000000";
  String _units = "0";
  String _average = "00.00";

  final _idController = TextEditingController();
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
              button: TextStyle(fontFamily: "Vazir", fontSize: 15))),
      scaffoldMessengerKey: _messengerKey,

      home: Directionality(
        textDirection: TextDirection.rtl,

        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,

              appBar: AppBar(
                title: _appBar(context),
                toolbarHeight: 230,
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
                      height: 15,
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
        Stack(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey.shade200,
              child: const CircleAvatar(
                radius: 70,
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
          height: 30,
        ),
        Text(
          "$_name $_lastname",
          style: const TextStyle(
            fontFamily: "Vazir",
            fontSize: 18,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                color: Colors.black12,
              ),
            ],
          ),
        )
      ]),
    );
  }

  _info(context) {
    return Container(
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
                "شماره دانشجویی",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                _id,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
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
          const Row(
            children: [
              Text(
                "ترم جاری",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "بهار 1402 - 1403",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
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
                "تعداد واحد",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                _units,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
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
                "معدل کل",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                _average,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black12,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _changeInfo(context) {
    return Container(
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

                    label: const Text("ویرایش مشخصات",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Vazir",
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black12,
                            ),
                          ],
                        )),

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

                    label: const Text("تغییر کلمه عبور",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Vazir",
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black12,
                            ),
                          ],
                        )),

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
    );
  }

  _changeInfo2(context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                30, 60, 30, MediaQuery.of(context).viewInsets.bottom + 25),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  children: [
                    const Text(
                      "نام جدید :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                                    borderSide: BorderSide.none),
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
                      "نام خانوادگی جدید :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                                    borderSide: BorderSide.none),
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
                      "شماره دانشجویی جدید :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                            controller: _idController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
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
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_nameController.text.isNotEmpty) {
                            _name = _nameController.text;
                            _nameController.text = "";
                          }
                          if (_lastnameController.text.isNotEmpty) {
                            _lastname = _lastnameController.text;
                            _lastnameController.text = "";
                          }
                          if (_idController.text.isNotEmpty) {
                            if (!_isNumeric(_idController.text)) {
                              _showTopSnackBar(context, "شماره دانشجویی متشکل از فقد اعداد است!");
                            }
                            else if (_idValidation(_idController.text)) {
                              _id = _idController.text;
                            }
                            else {
                              _showTopSnackBar(context, "این شماره دانشجویی قبلا ثبت شده است!");
                            }
                            _idController.text = "";
                          }
                        });
                      },

                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white),

                      child: const Text(
                        "ثبت تغییرات",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Vazir",
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 3,
                              color: Colors.black12,
                            ),
                          ],
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

  _changeInfo3(context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                30, 60, 30, MediaQuery.of(context).viewInsets.bottom + 25),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Row(
                  children: [
                    const Text(
                      "کلمه عبور فعلی :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white,
                                filled: true,
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
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Text(
                      "کلمه عبور جدید :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white,
                                filled: true,
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
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Text(
                      "تکرار کلمه عبور جدید :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 11,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black12,
                          ),
                        ],
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
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_passController.text.isEmpty) {
                            _showTopSnackBar(context, "کلمه عبور فعلی را وارد کنید!");
                          }
                          else if (_newPassController1.text.isEmpty) {
                            _showTopSnackBar(context, "کلمه عبور جدید را وارد کنید!");
                          }
                          else if (_newPassController2.text.isEmpty) {
                            _showTopSnackBar(context, "تکرار کلمه عبور جدید را وارد کنید!");
                          }
                          else if (!_currentPassValid(_passController.text)) {
                            _showTopSnackBar(context, "کلمه عبور فعلی اشتباه است!");
                            _passController.text = "";
                          }
                          else if (!_passValidation(_newPassController1.text, _id)) {
                            _showTopSnackBar(context, "کلمه عبور بهتری انتخاب کنید!");
                            _newPassController1.text = "";
                            _newPassController2.text = "";
                          }
                          else if (_newPassController1.text != _newPassController2.text) {
                            _showTopSnackBar(context, "کلمه عبور ها مطابقت ندارند!");
                            _newPassController2.text = "";
                          }
                          else {
                            _changePassword(_newPassController1.text);
                            _passController.text = "";
                            _newPassController1.text = "";
                            _newPassController2.text = "";
                            _showTopSnackBar(context, "کلمه عبور با موفقیت تغییر یافت!");
                          }
                        });
                      },

                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white),

                      child: const Text(
                        "ثبت تغییرات",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Vazir",
                          shadows: [
                            Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 3,
                              color: Colors.black12,
                            ),
                          ],
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

  _deleteAccountButton(context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(35),

      child: SizedBox(
        width: 300,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _removeStudent(_id);
            });
          },

          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white),

          child: const Text(
            "حذف حساب کاربری",
            style: TextStyle(
              fontSize: 17,
              fontFamily: "Vazir",
              shadows: [
                Shadow(
                  offset: Offset(3, 3),
                  blurRadius: 3,
                  color: Colors.black12,
                ),
              ],
            ),
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

  bool _isNumeric(String id) {
    return double.tryParse(id) != null;
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

        margin: const EdgeInsets.only(bottom: 445, right: 20, left: 20),

        action: SnackBarAction(
          onPressed: () {},
          label: "تایید",
          textColor: Colors.pink,
        ),
      ),
    );
  }

  bool _idValidation(String id) {
    // TODO
    return true;
  }

  bool _currentPassValid(String pass) {
    // TODO
    return true;
  }

  void _changePassword(String newPass) {
    // TODO
  }

  void _removeStudent(String id) {
    // TODO
  }
}
