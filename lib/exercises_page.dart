import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:flutter/material.dart';

import 'classes/assignment.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {

  final _hourLeft = TextEditingController();
  final _discription = TextEditingController();
  final _tDiscription = TextEditingController();


  final List<Assignment> _exercises = [
    Assignment("تمرین 1", Course("گسسته", 3, 100), 1),
    Assignment("تمرین 2", Course("گسسته", 3, 100), 4),
    Assignment("تمرین 2", Course("برنامه نویسی پیشرفته", 3, 100), 1)
  ];

  @override
  Widget build(BuildContext context) {
    _exercises[2].isActive = false;

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
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            });
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
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Todo()));
                            });
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
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ClassesPage()));
                            });
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
                      height: 15,
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
                        Text("تمرین ها",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("4 تیر 1403",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
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
    if (_exercises.isEmpty) {
      return Container(
        height: 640,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "هیج تمرینی نداری!",
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
          itemCount: _exercises.length,
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
    if (_exercises[index].isActive) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink,
        ),
        child: ListTile(
          title: Row(
            children: [
              Text(
                _exercises
                    .toList()[index]
                    .title,
                style: const TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 13,
                  color: Colors.white,
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
                                textDirection: TextDirection.rtl,
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
                                            "آیا کار را انجام داده اید؟",
                                            style: TextStyle(
                                              fontFamily: "Vazir",
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30,),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text("عنوان : ",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12),),
                                              const Spacer(),
                                              Text(_exercises[index].title,
                                                style: const TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12,
                                                    color: Colors.black54),),
                                              const SizedBox(width: 5,)
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              const Text("ددلاین : ",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12),),
                                              const Spacer(),
                                              Text("${_exercises[index]
                                                  .deadLine} روز دیگر",
                                                style: const TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12,
                                                    color: Colors.black54),),
                                              const SizedBox(width: 5,)
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              const Text(
                                                "زمان تخمینی باقی مانده : ",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12),),
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
                                                        hintText: "${_hourLeft
                                                            .text} ساعت",
                                                        hintStyle: const TextStyle(
                                                            fontFamily: "Vazir",
                                                            fontSize: 12,
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
                                              Text("توضیحات : ",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12),),
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
                                                controller: _discription,
                                                maxLines: 4,

                                                decoration: InputDecoration(
                                                    hintText: _discription.text,
                                                    hintStyle: const TextStyle(
                                                        fontFamily: "Vazir",
                                                        fontSize: 12,
                                                        color: Colors.black54),
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
                                              Text("نمره : ", style: TextStyle(
                                                  fontFamily: "Vazir",
                                                  fontSize: 12),),
                                              Spacer(),
                                              Text("ثبت نشده!",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12,
                                                    color: Colors.black54),),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          const Row(
                                            children: [
                                              Text("بارگذاری تمرین : ",
                                                style: TextStyle(
                                                    fontFamily: "Vazir",
                                                    fontSize: 12),),
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
                                                    controller: _tDiscription,

                                                    decoration: InputDecoration(
                                                        hintText: "توضیحات تحویل",
                                                        hintStyle: const TextStyle(
                                                            fontFamily: "Vazir",
                                                            fontSize: 12,
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
                                          onPressed: () {
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
                                                child: Text("ثبت",
                                                    style:
                                                    TextStyle(
                                                      fontFamily:
                                                      "Vazir",
                                                      color: Colors
                                                          .white,
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
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Text(
            _exercises[index].deadLine.toString(),
            style: const TextStyle(
                fontFamily: "Vazir",
                fontSize: 11,
                color: Colors.white
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: ListTile(
        title: Row(
          children: [
            Text(
              _exercises
                  .toList()[index]
                  .title,
              style: const TextStyle(
                fontFamily: "Vazir",
                fontSize: 13,
                color: Colors.white,
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
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
        subtitle: Text(
          _exercises[index].deadLine.toString(),
          style: const TextStyle(
              fontFamily: "Vazir",
              fontSize: 11,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
