import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

import 'classes/assignment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _today = "20 خرداد 1402";

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
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.pink.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home,
                            color: Colors.pink,
                            size: 33,
                          )),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () async {
                            await User.getTasks();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Todo()));
                          },
                          icon: const Icon(
                            Icons.dashboard_customize_outlined,
                            color: Colors.pink,
                            size: 33,
                          )),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () async {
                            await User.getClasses();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ClassesPage()));
                          },
                          icon: const Icon(
                            Icons.school_outlined,
                            color: Colors.pink,
                            size: 33,
                          )),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sensors,
                              color: Colors.pink, size: 33)),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ExercisesPage()));
                          },
                          icon: const Icon(
                            Icons.work_history_outlined,
                            color: Colors.pink,
                            size: 33,
                          )),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              body: Container(
                color: Colors.pink.withOpacity(0.03),
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
                                onPressed: () async {
                                  await User.infoPageReady();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Information()));
                                },
                                label: const Text("اطلاعات کاربری",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: "Vazir",
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
                        Icon(
                          Icons.circle,
                          color: Colors.pink,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "خلاصه",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                        const Icon(
                          Icons.circle,
                          color: Colors.pink,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "تمرین های جاری",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _today,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
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
                        const Icon(
                          Icons.circle,
                          color: Colors.pink,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "تمرین های انجام شده",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _today,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
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
                      color: Colors.white),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.timelapse,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "${User.exercises.where((e) => e.isActive == true).length} تا تمرین داری",
                        style: const TextStyle(
                          //color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Vazir",
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
                      color: Colors.white),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.heart_broken,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "0 تا امتحان داری",
                        style: TextStyle(
                          //color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Vazir",
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
                      color: Colors.white),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.access_alarms_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "0 تا تمرین پرید",
                        style: TextStyle(
                          //color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Vazir",
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
                      color: Colors.white),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.add_task,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "بهترین نمرت ${User.bestScore} عه",
                        style: const TextStyle(
                          //color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Vazir",
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
                      color: Colors.white),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.mood_bad,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "بدترین نمرت ${User.worstScore} عه",
                        style: const TextStyle(
                          //color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Vazir",
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
    if (User.exercises.where((e) => e.isActive == true).isEmpty) {
      return Container(
        height: 184,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "هیچ تمرینی وجود ندارد!",
            style: TextStyle(
              fontFamily: "Vazir",
              fontSize: 12,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return Container(
      height: 184,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: User.exercises.where((e) => e.isActive == true).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              User.exercises
                                  .where((e) => e.isActive == true)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                                                            10),
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
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Material(
                                                    elevation: 4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        await User.exeDone(User
                                                            .exercises
                                                            .where((e) =>
                                                                e.isActive ==
                                                                true)
                                                            .toList()[index]);

                                                        User.exercises
                                                            .where((e) =>
                                                                e.isActive ==
                                                                true)
                                                            .toList()[index]
                                                            .isActive = false;

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
                                                            child: Text("بله",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Vazir",
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize: 12,
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
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          User.exercises
                              .where((e) => e.isActive == true)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            //color: Colors.white,
                            fontSize: 11,
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
    if (User.exercises.where((e) => e.isActive == false).isEmpty) {
      return Container(
        height: 184,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "هیچ تمرینی انجام نشده!",
            style: TextStyle(
              fontFamily: "Vazir",
              fontSize: 12,
              color: Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return Container(
      height: 184,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: User.exercises.where((e) => e.isActive == false).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              User.exercises
                                  .where((e) => e.isActive == false)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                //color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          User.exercises
                              .where((e) => e.isActive == false)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 11,
                            //color: Colors.white,
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
