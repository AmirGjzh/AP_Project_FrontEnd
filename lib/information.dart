import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _informationState();
}

class _informationState extends State<Information> {
  var _studentFullName = "امیر محمد گنجی زاده";
  var _id = "402243093";
  var _currentTerm = "بهار 1402 - 1403";
  var _units = "18";
  var _average = "18.41";

  var _idController = TextEditingController();
  bool _idControllerEmpty = false;
  var _passController = TextEditingController();
  bool _passControllerEmpty = false;
  bool _passValid = false;
  var _newPassController1 = TextEditingController();
  bool _newPassControllerEmpty1 = false;
  bool _newPassValid1 = true;
  var _newPassController2 = TextEditingController();
  bool _newPassControllerEmpty2 = false;
  bool _newPassValid2 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Center(
                  child: Column(children: [
                    Container(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.grey.shade200,
                            child: CircleAvatar(
                              radius: 70,
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: InkWell(
                                  child: Icon(Icons.add_a_photo,
                                      color: Colors.pink.shade800),
                                  onTap: () {},
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      50,
                                    ),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 4),
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 3,
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      _studentFullName,
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 1,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                toolbarHeight: 230,
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
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
                      height: 15,
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
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              new Spacer(),
              Text(
                _id,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
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
                "ترم جاری",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              new Spacer(),
              Text(
                _currentTerm,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
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
              Text(
                "تعداد واحد",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              new Spacer(),
              Text(
                _units,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
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
              Text(
                "معدل کل",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Vazir",
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              new Spacer(),
              Text(
                _average,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: "Vazir",
                  color: Colors.black54,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
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
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.pink.shade50,
                        context: context,
                        builder: (BuildContext context) {
                          return Directionality(
                              textDirection: TextDirection.rtl,
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      30,
                                      60,
                                      30,
                                      MediaQuery.of(context).viewInsets.bottom +
                                          25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "شماره دانشجویی جدید",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Vazir",
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 200,
                                            height: 70,
                                            child: Stack(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 20,
                                                      offset: const Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              TextField(
                                                controller: _idController,
                                                decoration: InputDecoration(
                                                    errorText: _idControllerEmpty
                                                        ? "لطفا شماره دانشجویی جدید را وارد کنید!"
                                                        : null,
                                                    errorStyle: const TextStyle(
                                                        fontFamily: "Vazir",
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 8),
                                                    hintStyle: const TextStyle(
                                                      height: 50,
                                                      fontSize: 13,
                                                      fontFamily: "Vazir",
                                                      color: Colors.black54,
                                                      shadows: [
                                                        Shadow(
                                                          offset: Offset(1, 1),
                                                          blurRadius: 1,
                                                          color: Colors.black12,
                                                        ),
                                                      ],
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(20),
                                                        borderSide:
                                                        BorderSide.none),
                                                    fillColor: Colors.white,
                                                    filled: true),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 20,
                                            offset: const Offset(
                                              0,
                                              1,
                                            ),
                                          )
                                        ]),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_idController.text.isEmpty) {
                                                _idControllerEmpty = true;
                                              } else {
                                                _idControllerEmpty = false;
                                                _id = _idController.text;
                                                _idController.text = "";
                                              }
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16),
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
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        });
                  },
                  label: Text("ویرایش مشخصات",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black12,
                          ),
                        ],
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
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
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.lock),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.pink.shade50,
                        context: context,
                        builder: (BuildContext context) {
                          return Directionality(
                              textDirection: TextDirection.rtl,
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      30,
                                      60,
                                      30,
                                      MediaQuery.of(context).viewInsets.bottom +
                                          25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "کلمه عبور فعلی",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Vazir",
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          SizedBox(
                                            width: 200,
                                            height: 70,
                                            child: Stack(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 20,
                                                      offset: Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              TextField(
                                                controller: _passController,
                                                decoration: InputDecoration(
                                                    errorText: _passControllerEmpty
                                                        ? "لطفا کلمه عبور فعلی را وارد کنید!"
                                                        : (_passValid
                                                        ? null
                                                        : "کلمه عبور فعلی اشتباه است!"),
                                                    errorStyle: const TextStyle(
                                                        fontFamily: "Vazir",
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 8),
                                                    hintStyle: TextStyle(
                                                      height: 50,
                                                      fontSize: 13,
                                                      fontFamily: "Vazir",
                                                      color: Colors.black54,
                                                      shadows: [
                                                        Shadow(
                                                          offset: Offset(1, 1),
                                                          blurRadius: 1,
                                                          color: Colors.black12,
                                                        ),
                                                      ],
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(20),
                                                        borderSide:
                                                        BorderSide.none),
                                                    fillColor: Colors.white,
                                                    filled: true),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Divider(
                                        color: Colors.black38,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "کلمه عبور جدید",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Vazir",
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          SizedBox(
                                            width: 200,
                                            height: 70,
                                            child: Stack(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 20,
                                                      offset: Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              TextField(
                                                controller: _newPassController1,
                                                decoration: InputDecoration(
                                                    errorText: _newPassControllerEmpty1
                                                        ? "لطفا کلمه عبور جدید را وارد کنید!"
                                                        : (_newPassValid1
                                                        ? null
                                                        : "کلمه عبور بهتری انتخاب کنید!"),
                                                    errorStyle: const TextStyle(
                                                        fontFamily: "Vazir",
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 8),
                                                    hintStyle: TextStyle(
                                                      height: 50,
                                                      fontSize: 13,
                                                      fontFamily: "Vazir",
                                                      color: Colors.black54,
                                                      shadows: [
                                                        Shadow(
                                                          offset: Offset(1, 1),
                                                          blurRadius: 1,
                                                          color: Colors.black12,
                                                        ),
                                                      ],
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(20),
                                                        borderSide:
                                                        BorderSide.none),
                                                    fillColor: Colors.white,
                                                    filled: true),
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Divider(
                                        color: Colors.black38,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "تکرار کلمه عبور جدید",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Vazir",
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          SizedBox(
                                            width: 200,
                                            height: 70,
                                            child: Stack(children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 20,
                                                      offset: Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              TextField(
                                                controller: _newPassController2,
                                                decoration: InputDecoration(
                                                    errorText: _newPassControllerEmpty2
                                                        ? "لطفا تکرار کلمه عبور جدید را وارد کنید!"
                                                        : (_newPassValid2
                                                        ? null
                                                        : "مطابقت ندارد!"),
                                                    errorStyle: const TextStyle(
                                                        fontFamily: "Vazir",
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 8),
                                                    hintStyle: TextStyle(
                                                      height: 50,
                                                      fontSize: 13,
                                                      fontFamily: "Vazir",
                                                      color: Colors.black54,
                                                      shadows: [
                                                        Shadow(
                                                          offset: Offset(1, 1),
                                                          blurRadius: 1,
                                                          color: Colors.black12,
                                                        ),
                                                      ],
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(20),
                                                        borderSide:
                                                        BorderSide.none),
                                                    fillColor: Colors.white,
                                                    filled: true),
                                              ),
                                            ]),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
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
                                              _passController.text.isEmpty
                                                  ? _passControllerEmpty = true
                                                  : _passControllerEmpty =
                                              false;
                                              _newPassController1.text.isEmpty
                                                  ? _newPassControllerEmpty1 =
                                              true
                                                  : _newPassControllerEmpty1 =
                                              false;
                                              _newPassController2.text.isEmpty
                                                  ? _newPassControllerEmpty2 =
                                              true
                                                  : _newPassControllerEmpty2 =
                                              false;

                                              if (!_newPassControllerEmpty2 &&
                                                  !_passControllerEmpty &&
                                                  !_newPassControllerEmpty1) {
                                                switch (_changePasswordState(
                                                    _passController.text,
                                                    _newPassController1.text,
                                                    _newPassController2.text)) {
                                                  case 1:
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
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16),
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
                                                  blurRadius: 1,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        });
                  },
                  label: Text("تغییر کلمه عبور",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Vazir",
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Colors.black12,
                          ),
                        ],
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
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

  _deleteAccountButton(context) {
    return SizedBox(
      width: 355,
      child: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 18),
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white),
        child: const Text(
          "حذف حساب کاربری",
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
    );
  }

  int _changePasswordState(String pass, String newPass1, String newPass2) {
    return 1;
  }
}
