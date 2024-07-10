import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/news_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String today = User.today;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 15,
                  fontWeight: FontWeight.bold))),
      home: Directionality(
        textDirection: TextDirection.ltr,
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
                          onPressed: () async {
                            await User.homePageReady();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          },
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
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
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
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
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
                          onPressed: () async {
                            await User.newsPageReady();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const NewsPage()));
                          },
                          icon: const Icon(Icons.feedback_outlined,
                              color: Colors.pink, size: 30)),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () async {
                            await User.getExercises();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
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
                          textDirection: TextDirection.rtl,
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
                                label: const Text("User Info",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: "Vazir",
                                        fontWeight: FontWeight.bold)),
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
                          "Summery",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 14,
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
                          "Current exercises",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          today,
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
                          "Done exercises",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          today,
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
                        color: Colors.pink,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Have ${User.exercises.where((e) => e.isActive == true).length} exercises",
                        style: const TextStyle(
                            //color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
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
                        Icons.heart_broken,
                        color: Colors.pink,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Have ${User.exams} exams",
                        style: const TextStyle(
                            //color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
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
                        Icons.access_alarms_sharp,
                        color: Colors.pink,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Lost ${User.exercises.where((e) => e.deadLine <= 0).length} exercises",
                        style: const TextStyle(
                            //color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
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
                        color: Colors.pink,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Best score is ${User.bestScore}",
                        style: const TextStyle(
                            //color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
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
                        color: Colors.pink,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Worst score is ${User.worstScore}",
                        style: const TextStyle(
                            //color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Vazir",
                            fontWeight: FontWeight.bold),
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
    if (User.exercises
        .where((e) => e.isActive == true)
        .where((e) => e.deadLine >= 0)
        .isEmpty) {
      return Container(
        height: 184,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "There is no exercises!",
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
          itemCount: User.exercises
              .where((e) => e.isActive == true)
              .where((e) => e.deadLine >= 0)
              .length,
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
                                  .where((e) => e.deadLine >= 0)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                color: Colors.pink,
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
                                                  "Did you finish the exercise?",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                            child: Text("No",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Vazir",
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
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
                                                            child: Text("Yes",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Vazir",
                                                                    color: Colors
                                                                        .pink,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
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
                                    Icons.edit_notifications_outlined,
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
                              .where((e) => e.deadLine >= 0)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                              fontFamily: "Vazir",
                              //color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
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
    if (User.exercises
        .where((e) => e.isActive == false)
        .where((e) => e.deadLine >= 0)
        .isEmpty) {
      return Container(
        height: 184,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "No exercise finished!",
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
          itemCount: User.exercises
              .where((e) => e.isActive == false)
              .where((e) => e.deadLine >= 0)
              .length,
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
                                  .where((e) => e.deadLine >= 0)
                                  .toList()[index]
                                  .course
                                  .name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 13,
                                color: Colors.pink,
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
                                  Text(
                                    "Done",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          User.exercises
                              .where((e) => e.isActive == false)
                              .where((e) => e.deadLine >= 0)
                              .toList()[index]
                              .title,
                          style: const TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 11,
                              fontWeight: FontWeight.bold
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
