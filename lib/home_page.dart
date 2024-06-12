import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:flutter/material.dart';

import 'classes/assignment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _exersiceCount = "0";
  String _examCount = "0";
  String _notDoneExersices = "0";
  String _bestScore = "20.00";
  String _worstScore = "00.00";

  String _today = "20 خرداد 1402";

  final List<Assignment> _exercises = [
    Assignment("تمرین 1", Course("گسسته", 3, 100), 1),
    Assignment("تمرین 2", Course("گسسته", 3, 100), 4),
    Assignment("تمرین 2", Course("برنامه نویسی پیشرفته", 3, 100), 1)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(fontFamily: "Vazir", fontSize: 15))),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (context) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 75,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Colors.pink,
                ),

                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    Icons.home,
                                    color: Colors.deepPurple,
                                    size: 33,
                                  ))),
                          const Text(
                            "سرا",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.ballot,
                                color: Colors.deepPurple,
                                size: 33,
                              )),
                          const Text(
                            "تسکا",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const ClassesPage()));
                                });
                              },
                              icon: const Icon(
                                Icons.school,
                                color: Colors.deepPurple,
                                size: 33,
                              )),
                          const Text(
                            "کلاسا",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.sensors_outlined,
                                  color: Colors.deepPurple, size: 33)),
                          const Text(
                            "خبرا",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.work_history,
                                color: Colors.deepPurple,
                                size: 33,
                              )),
                          const Text(
                            "کارا",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
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
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              body: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),

                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(35),

                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const Information()));
                                    });
                                  },
                                  label: const Text("اطلاعات کاربری",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
                                    backgroundColor: Colors.pink,
                                  ),
                                ),
                            ),
                          ),
                          ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.circle, color: Colors.pink, size: 15,),
                        SizedBox(width: 10,),
                        Text(
                          "خلاصه",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _summery(context),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.circle, color: Colors.pink, size: 15,),
                        const SizedBox(width: 10,),
                        const Text(
                          "تمرین های جاری",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                          _today,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _exercisesPart(context),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.circle, color: Colors.pink, size: 15,),
                        const SizedBox(width: 10,),
                        const Text(
                          "تمرین های انجام شده",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                          _today,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _doneExercises(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _summery(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),

        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink),

                    child: Column(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "$_exersiceCount تا تمرین داری",
                          style: const TextStyle(
                            color: Colors.white,
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
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink),

                    child: Column(
                      children: [
                        const Icon(
                          Icons.heart_broken,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "$_examCount تا امتحان داری",
                          style: const TextStyle(
                            color: Colors.white,
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
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink),

                    child: Column(
                      children: [
                        const Icon(
                          Icons.access_alarms_sharp,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "$_notDoneExersices تا تمرین پرید",
                          style: const TextStyle(
                            color: Colors.white,
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
                        )
                      ],
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
                  borderRadius: BorderRadius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        color: Colors.pink),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.add_task,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "بهترین نمرت $_bestScore عه",
                          style: const TextStyle(
                            color: Colors.white,
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
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        color: Colors.pink),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.mood_bad,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "بدترین نمرت $_worstScore عه",
                          style: const TextStyle(
                            color: Colors.white,
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
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      );
  }

  _exercisesPart(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView.builder(
          itemCount: _exercises.where((e) => e.isActive == true).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink,
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              _exercises
                                  .where((e) => e.isActive == true)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: const SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "آیا تمرین را انجام داده اید؟",
                                                  style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12,
                                                    shadows: [
                                                      Shadow(
                                                        offset: Offset(2, 2),
                                                        blurRadius: 3,
                                                        color: Colors.black12,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                children: [
                                                  Material(
                                                    elevation: 4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: const Center(
                                                            child: Text("خیر",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Vazir",
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  shadows: [
                                                                    Shadow(
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              2),
                                                                      blurRadius:
                                                                          3,
                                                                      color: Colors
                                                                          .black12,
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Material(
                                                    elevation: 4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _exercises
                                                              .where((e) =>
                                                                  e.isActive ==
                                                                  true)
                                                              .toList()[index]
                                                              .isActive = false;
                                                          Navigator.of(context)
                                                              .pop();
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: const Center(
                                                            child: Text("بله",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Vazir",
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize: 12,
                                                                  shadows: [
                                                                    Shadow(
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              2),
                                                                      blurRadius:
                                                                          3,
                                                                      color: Colors
                                                                          .black12,
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ));
                                });
                              },
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Icon(
                                    Icons.check_box_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          _exercises
                              .where((e) => e.isActive == true)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            color: Colors.white,
                            fontSize: 11,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }

  _doneExercises(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView.builder(
          itemCount: _exercises.where((e) => e.isActive == false).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink,
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              _exercises
                                  .where((e) => e.isActive == false)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                            GestureDetector(
                              onTap: () {},
                              child: const Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          _exercises
                              .where((e) => e.isActive == false)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 11,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }
}
