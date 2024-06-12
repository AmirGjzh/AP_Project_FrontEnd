import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  final _classCodeController = TextEditingController();

  Teacher teacher1 = Teacher("حمید رضا", "مهدیانی", "", "");
  Teacher teacher2 = Teacher("اسمائیل", "زیبایی", "", "");
  Teacher teacher3 = Teacher("میترا", "ابولحسنی", "", "");

  Course course1 = Course("مدار منطقی", 3, 100);
  Course course2 = Course("فیزیک 2", 3, 100);
  Course course3 = Course("دیفرانسیل", 3, 100);

  final List<Course> courses = [];

  @override
  Widget build(BuildContext context) {
    course1.teacher = teacher1;
    course2.teacher = teacher2;
    course3.teacher = teacher3;
    courses.add(course1);
    courses.add(course2);
    courses.add(course3);

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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
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
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                                });
                              },
                              icon: const Icon(
                                Icons.home,
                                color: Colors.deepPurple,
                                size: 33,
                              )),
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
                              onPressed: () {},
                              icon: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    Icons.school,
                                    color: Colors.deepPurple,
                                    size: 33,
                                  ))),
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
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.pink,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("کلاس ها",
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black12,
                              ),
                            ],
                          )),
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
                                            textDirection: TextDirection.rtl,
                                            child: SingleChildScrollView(
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    30,
                                                    60,
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
                                                          "کد درس :",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: "Vazir",
                                                            shadows: [
                                                              Shadow(
                                                                offset: Offset(
                                                                    1, 1),
                                                                blurRadius: 3,
                                                                color: Colors
                                                                    .black12,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Material(
                                                          elevation: 4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: SizedBox(
                                                            width: 200,
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
                                                      ],
                                                    ),
                                                    const SizedBox(height: 25),
                                                    Material(
                                                      elevation: 10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              35),
                                                      child: SizedBox(
                                                        width: 300,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {});
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
                                                                  Colors.white),
                                                          child: const Text(
                                                            "افزودن",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  "Vazir",
                                                              shadows: [
                                                                Shadow(
                                                                  offset:
                                                                      Offset(
                                                                          3, 3),
                                                                  blurRadius: 3,
                                                                  color: Colors
                                                                      .black12,
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
                                      });
                                });
                              },
                              label: const Text("افزودن کلاس",
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
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 665,
                    child: ListView.builder(
                        itemCount: courses.length,
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
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.pink),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.school,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(courses[index].name,
                                            style: const TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            )),
                                        const Spacer(),
                                        Text(
                                            "استاد: ${courses[index].teacher!.name} ${courses[index].teacher!.lastname}",
                                            style: const TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 12,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.numbers,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                            " تعداد واحد: ${courses[index].units}",
                                            style: const TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 12,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.task,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(" تکالیف باقی مانده: ${4}",
                                            style: const TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 12,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.add_reaction_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                            " دانشجوی ممتاز: ${"امیرمحمد گنحی زاده"}",
                                            style: const TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 12,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(2, 2),
                                                  blurRadius: 3,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
