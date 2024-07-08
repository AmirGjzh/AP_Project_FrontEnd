import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:ap_project_frontend/user.dart';
import 'package:flutter/material.dart';

import 'classes/assignment.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final _hourLeft = TextEditingController(text: "");
  final _description = TextEditingController(text: "");
  final _tDescription = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    User.exercises.sort((a, b) => (!a.isActive && b.isActive) ? 1 : -1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              button: TextStyle(fontFamily: "Vazir", fontSize: 15, fontWeight: FontWeight.bold))),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                              Navigator.of(context).push(MaterialPageRoute(
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.work_history,
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
                        Text("Exercises",
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
                    _exercise(context),
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

  _exercise(BuildContext context) {
    if (User.exercises.isEmpty) {
      return Container(
        height: 640,
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
      height: 640,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: User.exercises.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(20),
                    child: _exe(context, index)
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

  _exe(BuildContext context, int index) {
    if (User.exercises[index].isActive) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ListTile(
          title: Row(
            children: [
              Text(
                User.exercises
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
                        builder: (context) =>
                            AlertDialog(
                              content: Directionality(
                                textDirection: TextDirection.ltr,
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 500,
                                    width: 700,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              child: const Icon(
                                                Icons.close, color: Colors.pink,),
                                              onTap: () {
                                                setState(() {
                                                  Navigator.of(context)
                                                      .pop();
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 37,),
                                            const Text(
                                              "Exercise Information",
                                              style: TextStyle(
                                                fontFamily: "Vazir",
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 30,),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text("title : ",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11),),
                                                Text(User.exercises[index].title,
                                                  style: const TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.pink),),
                                                const SizedBox(width: 5,)
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text("Deadline : ",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11),),
                                                Text(User.exercises[index]
                                                    .deadLine2,
                                                  style: const TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.pink),),
                                                const SizedBox(width: 5,)
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Estimated time remaining :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                      fontFamily: "Vazir",
                                                      fontSize: 11),),
                                                const Spacer(),
                                                Material(
                                                  elevation: 4,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                  child: SizedBox(
                                                    height: 40,
                                                    width: 80,
                                  
                                                    child: TextField(
                                                      controller: _hourLeft,
                                  
                                                      decoration: InputDecoration(
                                                          hintText: "${User.exercises[index].hourLeft
                                                              } hours",
                                                          hintStyle: const TextStyle(
                                                              fontFamily: "Vazir",
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 11,
                                                              color: Colors
                                                                  .black54),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(10),
                                                            //borderSide: BorderSide.none
                                                          ),
                                                          fillColor: Colors.white,
                                                          filled: true),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            const Row(
                                              children: [
                                                Text("Description :",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11),),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Material(
                                              elevation: 4,
                                              borderRadius: BorderRadius.circular(
                                                  10),
                                              child: SizedBox(
                                                height: 150,
                                                width: 300,
                                  
                                                child: TextField(
                                                  controller: _description,
                                                  maxLines: 4,
                                  
                                                  decoration: InputDecoration(
                                                      hintText: User.exercises[index].description.isEmpty ? "Description..." : User.exercises[index].description,
                                                      hintStyle: const TextStyle(
                                                          fontFamily: "Vazir",
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors
                                                              .black54),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(10),
                                                        //borderSide: BorderSide.none
                                                      ),
                                                      fillColor: Colors.white,
                                                      filled: true),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20,),
                                            const Row(
                                              children: [
                                                Text("Score : ", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    fontFamily: "Vazir",
                                                    fontSize: 11),),
                                                Text("00.00",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.pink),),
                                                SizedBox(width: 5,)
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            const Row(
                                              children: [
                                                Text("Upload :",
                                                  style: TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 11),),
                                                Spacer(),
                                  
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Material(
                                                  elevation: 4,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                  child: SizedBox(
                                                    height: 40,
                                                    width: 230,
                                  
                                                    child: TextField(
                                                      controller: _tDescription,
                                  
                                                      decoration: InputDecoration(
                                                          hintText: User.exercises[index].tDescription.isEmpty ? "Details..." : User.exercises[index].tDescription,
                                                          hintStyle: const TextStyle(
                                                              fontFamily: "Vazir",
                                                              fontSize: 11,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors
                                                                  .black54),
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(10),
                                                            //borderSide: BorderSide.none
                                                          ),
                                                          fillColor: Colors.white,
                                                          filled: true),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.file_upload_outlined,
                                                  size: 35,)
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    Material(
                                      elevation: 4,
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                      child: Container(
                                        height: 50,
                                        width: 272,
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(10),
                                          color: Colors.pink,
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            if (_hourLeft.text.isNotEmpty) {
                                              User.exercises[index].hourLeft = _hourLeft.text;
                                            }
                                            if (_description.text.isNotEmpty) {
                                              User.exercises[index].description = _description.text;
                                            }
                                            if (_tDescription.text.isNotEmpty) {
                                              User.exercises[index].tDescription = _tDescription.text;
                                            }
                                            _hourLeft.text = "";
                                            _description.text = "";
                                            _tDescription.text = "";

                                            await User.exeRecord(User.exercises[index]);

                                            Navigator.of(context)
                                                .pop();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 250,
                                            decoration:
                                            BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10),
                                              color: Colors.pink,
                                            ),
                                            child: const Center(
                                                child: Text("Record",
                                                    style:
                                                    TextStyle(
                                                      fontFamily:
                                                      "Vazir",
                                                      color: Colors
                                                          .white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,

                                                    ))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
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
                      Icons.circle_outlined,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Text(
            "${User.exercises[index].deadLine2}  left",
            style: const TextStyle(
                fontFamily: "Vazir",
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(
              User.exercises
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
              },
              child: const Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Icon(
                    Icons.add_task,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
        subtitle: Text(
          "${User.exercises[index].deadLine2}  left",
          style: const TextStyle(
              fontFamily: "Vazir",
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
