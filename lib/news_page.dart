import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/login_page.dart';
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
                          icon: const Icon(Icons.feedback,
                              color: Colors.pink, size: 30)),
                    ),
                    const Spacer(),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {},
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
                                color: (_state == 1) ? Colors.pink.shade100 : Colors.white
                              ),
                              height: 50,
                              width: 110,
                              child: const Center(
                                child: Text(
                                  "Last news",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
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
                                  color: (_state == 2) ? Colors.pink.shade100 : Colors.white
                              ),
                              height: 50,
                              width: 145,
                              child: const Center(
                                child: Text(
                                    "Birthdays today",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
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
                                  color: (_state == 3) ? Colors.pink.shade100 : Colors.white
                              ),
                              height: 50,
                              width: 110,
                              child: const Center(
                                child: Text(
                                    "Extensions",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                ),
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
                    Text("--------------------------- Today ( ${User.today}) ---------------------------",
                        style: const TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )
                    ),
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
        return Container(
          height: 580,
          width: 360,
          color: Colors.red,

          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 170,
                width: 340,
                color: Colors.yellow,
                child: Row(
                  children: [
                    Column(
                      
                    ),
                    Spacer(),
                    Image.asset("assets/images/sbu.png", width: 100, height: 100),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      case 2:
      case 3:
    }
  }
}
