import 'package:ap_project_frontend/classes/task.dart';
import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/news_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';


class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _title = TextEditingController();
  int _minute = 0;
  int _hour = 12;
  int _isMorning = 0;
  final String _today = User.today;

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
                            Icons.dashboard_customize,
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
                child: Column(
                  children: [
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
                        const Text("Tasks",
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
                                        backgroundColor: Colors.pink.shade50,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: SingleChildScrollView(
                                                child: Container(
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
                                                            "Title :",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Vazir",
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Material(
                                                            elevation: 4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: SizedBox(
                                                              width: 250,
                                                              height: 60,
                                                              child: Stack(
                                                                  children: [
                                                                    TextField(
                                                                      controller:
                                                                          _title,
                                                                      decoration: InputDecoration(
                                                                          border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              borderSide: const BorderSide(color: Colors.teal)),
                                                                          fillColor: Colors.white,
                                                                          filled: true),
                                                                    ),
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 25),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                child: Material(
                                                                  elevation: 10,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              35),
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 80,
                                                                    decoration: BoxDecoration(
                                                                        color: (_isMorning ==
                                                                                1)
                                                                            ? Colors
                                                                                .pink
                                                                            : Colors
                                                                                .pink.shade200,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "AM",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Vazir",
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    _isMorning =
                                                                        1;
                                                                  });
                                                                },
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              InkWell(
                                                                child: Material(
                                                                  elevation: 10,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              35),
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 80,
                                                                    decoration: BoxDecoration(
                                                                        color: (_isMorning ==
                                                                                2)
                                                                            ? Colors
                                                                                .pink
                                                                            : Colors
                                                                                .pink.shade200,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "PM",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Vazir",
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    _isMorning =
                                                                        2;
                                                                  });
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_up,
                                                                  color: Colors
                                                                      .pink,
                                                                  size: 35,
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_hour ==
                                                                        12) {
                                                                      _hour = 1;
                                                                    } else {
                                                                      _hour++;
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Material(
                                                                elevation: 10,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35),
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  width: 70,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      (_hour.toString().length ==
                                                                              2)
                                                                          ? _hour
                                                                              .toString()
                                                                          : "0$_hour",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontFamily:
                                                                            "Vazir",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              InkWell(
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: Colors
                                                                      .pink,
                                                                  size: 35,
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_hour ==
                                                                        1) {
                                                                      _hour =
                                                                          12;
                                                                    } else {
                                                                      _hour--;
                                                                    }
                                                                  });
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Column(
                                                            children: [
                                                              Text(
                                                                ":",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Vazir",
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_up,
                                                                  color: Colors
                                                                      .pink,
                                                                  size: 35,
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_minute ==
                                                                        59) {
                                                                      _minute =
                                                                          0;
                                                                    } else {
                                                                      _minute++;
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Material(
                                                                elevation: 10,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35),
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  width: 70,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      (_minute.toString().length ==
                                                                              2)
                                                                          ? _minute
                                                                              .toString()
                                                                          : "0$_minute",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontFamily:
                                                                            "Vazir",
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              InkWell(
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: Colors
                                                                      .pink,
                                                                  size: 35,
                                                                ),
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_minute ==
                                                                        0) {
                                                                      _minute =
                                                                          59;
                                                                    } else {
                                                                      _minute--;
                                                                    }
                                                                  });
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 25),
                                                      Material(
                                                        elevation: 10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        child: SizedBox(
                                                          width: 350,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              await User.addTask(Task(
                                                                  _title.text,
                                                                  _hour
                                                                      .toString(),
                                                                  _minute
                                                                      .toString(),
                                                                  (_isMorning ==
                                                                          1)
                                                                      ? true
                                                                      : false));
                                                              _title.text = "";
                                                              _minute = 0;
                                                              _hour = 12;
                                                              _isMorning = 0;
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                shape:
                                                                    const StadiumBorder(),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            16),
                                                                backgroundColor:
                                                                    Colors.pink,
                                                                foregroundColor:
                                                                    Colors
                                                                        .white),
                                                            child: const Text(
                                                              "Add",
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Vazir",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        });
                                  });
                                },
                                label: const Text("New Task",
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
                    _newTasks(context),
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
                          "Done tasks",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Text(_today,
                            style: const TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _doneTasks(context),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _newTasks(BuildContext context) {
    if (User.tasks.where((t) => t.isDone == false).isEmpty) {
      return Container(
        height: 295,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "There is no task!",
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
      height: 295,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: User.tasks.where((t) => t.isDone == false).length,
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
                              User.tasks
                                  .where((t) => t.isDone == false)
                                  .toList()[index]
                                  .title,
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
                                                  "Did you finish the task?",
                                                  style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontWeight: FontWeight.bold,
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
                                                            child: Text("No",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Vazir",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                        await User.taskDone(User
                                                            .tasks
                                                            .where((t) =>
                                                                t.isDone ==
                                                                false)
                                                            .toList()[index]);
                                                        User.tasks
                                                            .where((t) =>
                                                                t.isDone ==
                                                                false)
                                                            .toList()[index]
                                                            .isDone = true;
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
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Vazir",
                                                                  color: Colors
                                                                      .pink,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                          "${User.tasks.where((t) => t.isDone == false).toList()[index].hour}:${User.tasks.where((t) => t.isDone == false).toList()[index].minute} ${(User.tasks.where((t) => t.isDone == false).toList()[index].isMorning) ? "AM" : "PM"}",
                          style: const TextStyle(
                              fontFamily: "Vazir",
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

  _doneTasks(BuildContext context) {
    if (User.tasks.where((t) => t.isDone == true).isEmpty) {
      return Container(
        height: 295,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "No task finished!",
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
      height: 295,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: User.tasks.where((t) => t.isDone == true).length,
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
                              User.tasks
                                  .where((t) => t.isDone == true)
                                  .toList()[index]
                                  .title,
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
                          "${User.tasks.where((t) => t.isDone == true).toList()[index].hour}:${User.tasks.where((t) => t.isDone == true).toList()[index].minute} ${(User.tasks.where((t) => t.isDone == true).toList()[index].isMorning) ? "AM" : "PM"}",
                          style: const TextStyle(
                              fontFamily: "Vazir",
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
}
