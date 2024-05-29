import 'package:flutter/material.dart';

import 'login_page.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _informationState();
}

class _informationState extends State<Information> {
  var _studentFullName = "امیر محمد گنجی زاده";
  var _studentNumber = "402243093";
  var _currentTerm = "بهار 1402 - 1403";
  var _units = "18";
  var _average = "18.41";

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
                              backgroundImage:
                                  AssetImage('assets/images/amir.png'),
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
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
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
                    Container(
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
                                _studentNumber,
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
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //-----------

                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink.shade50,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              new Spacer(),
                              SizedBox(
                                height: 40,
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
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
                              new Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              new Spacer(),
                              SizedBox(
                                height: 40,
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.lock),
                                  onPressed: () {},
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
                              new Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //-----------

                    SizedBox(
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
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
