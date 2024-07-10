import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/news_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  final _classCodeController = TextEditingController();
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

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
      scaffoldMessengerKey: _messengerKey,
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
                            Icons.school,
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
                child: Column(children: [
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
                      const Text("Courses",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
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
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: SingleChildScrollView(
                                              child: Container(
                                                color: Colors.pink
                                                    .withOpacity(0.03),
                                                padding: EdgeInsets.fromLTRB(
                                                    30,
                                                    30,
                                                    30,
                                                    MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom +
                                                        25),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "Course : ",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: "Vazir",
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Material(
                                                          elevation: 4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: SizedBox(
                                                            width: 180,
                                                            height: 60,
                                                            child: Stack(
                                                                children: [
                                                                  TextField(
                                                                    controller:
                                                                        _classCodeController,
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                20),
                                                                            borderSide: const BorderSide(
                                                                                color: Colors
                                                                                    .teal)),
                                                                        fillColor:
                                                                            Colors
                                                                                .white,
                                                                        filled:
                                                                            true),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Material(
                                                          elevation: 4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors
                                                                    .pink),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                String state =
                                                                    await User.addCourse(
                                                                        _classCodeController
                                                                            .text);

                                                                if (state ==
                                                                    "invalid") {
                                                                  _showTopSnackBar(
                                                                      context,
                                                                      "There is no course with this name!");
                                                                } else {
                                                                  _showTopSnackBar(
                                                                      context,
                                                                      "Added successfully!");
                                                                }
                                                                _classCodeController
                                                                    .text = "";
                                                              },
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 40,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      });
                                });
                              },
                              label: const Text("Add course",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
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
                  const SizedBox(
                    height: 15,
                  ),
                  _classes(context)
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

  _classes(BuildContext context) {
    if (User.classes.isEmpty) {
      return const SizedBox(
        height: 665,
        child: Center(
          child: Text(
            "You are not in any courses!",
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
      height: 665,
      child: ListView.builder(
          itemCount: User.classes.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  height: 170,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.school,
                            color: Colors.pink,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(User.classes[index].name,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )),
                          const Spacer(),
                          const Text("Teacher : ",
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(
                              "${User.classes[index].teacher!.name} ${User.classes[index].teacher!.lastname}",
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )),
                        ],
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text("Units : ",
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text("${User.classes[index].units}",
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text("Exercises left : ",
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(User.classes[index].exeLeft,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text("Top student : ",
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text(User.classes[index].topName,
                              style: const TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  _showTopSnackBar(BuildContext context, String message) {
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
        margin: const EdgeInsets.only(bottom: 70, right: 20, left: 20),
        action: SnackBarAction(
          onPressed: () {},
          label: "Ok",
          textColor: Colors.pink,
        ),
      ),
    );
  }
}
