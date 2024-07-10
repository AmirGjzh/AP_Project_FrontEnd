import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

import 'classes_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _state = 1;

  @override
  Widget build(BuildContext context) {
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          icon: const Icon(
                            Icons.home_outlined,
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const NewsPage()));
                          },
                          icon: const Icon(Icons.feedback,
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExercisesPage()));
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
                      height: 20,
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
                        Text("News",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: const Border(
                                    top: BorderSide(color: Colors.pink),
                                    left: BorderSide(color: Colors.pink),
                                    right: BorderSide(color: Colors.pink),
                                    bottom: BorderSide(color: Colors.pink),
                                  ),
                                  color: (_state == 1)
                                      ? Colors.pink.shade100
                                      : Colors.white),
                              height: 50,
                              width: 110,
                              child: const Center(
                                child: Text("Last news",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _state = 1;
                              });
                            },
                          ),
                        ),
                        const Spacer(),
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: const Border(
                                    top: BorderSide(color: Colors.pink),
                                    left: BorderSide(color: Colors.pink),
                                    right: BorderSide(color: Colors.pink),
                                    bottom: BorderSide(color: Colors.pink),
                                  ),
                                  color: (_state == 2)
                                      ? Colors.pink.shade100
                                      : Colors.white),
                              height: 50,
                              width: 145,
                              child: const Center(
                                child: Text("Birthdays today",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _state = 2;
                              });
                            },
                          ),
                        ),
                        const Spacer(),
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: const Border(
                                    top: BorderSide(color: Colors.pink),
                                    left: BorderSide(color: Colors.pink),
                                    right: BorderSide(color: Colors.pink),
                                    bottom: BorderSide(color: Colors.pink),
                                  ),
                                  color: (_state == 3)
                                      ? Colors.pink.shade100
                                      : Colors.white),
                              height: 50,
                              width: 110,
                              child: const Center(
                                child: Text("Extensions",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _state = 3;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "--------------------------- Today ( ${User.today}) ---------------------------",
                        style: const TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    _page(context)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _page(BuildContext context) {
    switch (_state) {
      case 1:
        return SizedBox(
          height: 580,
          width: 360,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 170,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Shahid Beheshti University",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Students of the Arabic\n"
                              "language and literature\n"
                              "department met with the\n"
                              "president of the university",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "More info...",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/sbu.png",
                                width: 150,
                                height: 150,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 170,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Shahid Beheshti University",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Advisor to the university\npresident was appointed\nin international projects in\nthe field of biotechnologies",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "More info...",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/sbu.png",
                                width: 150,
                                height: 150,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 170,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Shahid Beheshti University",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "The top physical protection\nstaff of the university\nwere introduced",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "More info...",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/sbu.png",
                                width: 150,
                                height: 150,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        if (User.dates.isEmpty) {
          return const SizedBox(
            height: 580,
            width: 360,
            child: Center(
              child: Text(
                "It is nobody's birthday!",
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
        return SizedBox(
          height: 580,
          width: 360,
          child: ListView.builder(
              itemCount: User.dates.length,
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
                              color: Colors.white,
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  const Text(
                                    "Happy birthday to ",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    User.dates
                                        .toList()[index]
                                        .replaceAll("-", " "),
                                    style: const TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.card_giftcard_sharp,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
        );
      case 3:
        if (User.changes.isEmpty) {
          return const SizedBox(
            height: 580,
            width: 360,
            child: Center(
              child: Text(
                "No extensions!",
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
        return SizedBox(
          height: 580,
          width: 360,
          child: ListView.builder(
              itemCount: User.dates.length,
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
                              color: Colors.white,
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    User.changes[index].split("-")[1],
                                    style: const TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 14,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        converter(int.parse(
                                            User.changes[index].split("-")[2])),
                                        style: const TextStyle(
                                          fontFamily: "Vazir",
                                          fontSize: 12,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                User.changes[index].split("-")[0],
                                style: const TextStyle(
                                    fontFamily: "Vazir",
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )),
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

  String converter(int deadLine) {
    String deadLine2 = "";
    deadLine2 += "${(deadLine / 1440).floor()} : ";
    deadLine %= 1440;
    deadLine2 += (deadLine / 60 >= 10)
        ? "${(deadLine / 60).floor()} : "
        : "0${(deadLine / 60).floor()} : ";
    deadLine %= 60;
    deadLine2 += (deadLine >= 10) ? "$deadLine" : "0$deadLine";
    return deadLine2;
  }
}
