import 'dart:convert';
import 'dart:io';

import 'package:ap_project_frontend/classes/assignment.dart';
import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes/student.dart';
import 'package:ap_project_frontend/classes/task.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/classes_page.dart';

class User {
  static var MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  static DateTime now = DateTime.now();
  static String today = "${now.day}  ${MONTHS[now.month-1]}  ${now.year}";
  static const String IP = "192.168.1.208";
  static Student? user;
  static late String average;
  static late String bestScore;
  static late String worstScore;
  static late String exams;
  static List<Assignment> exercises = [];
  static List<Course> classes = [];
  static List<Task> tasks = [];
  static List<String> dates = [];
  static List<String> changes = [];

  static setUser(String name, String lastname, String id, String password) async {
    user = Student(name, lastname, id, password);
    await setUnits();
    await getAverage();
  }

  static infoPageReady() async {
    await setUnits();
    await getAverage();
  }

  static setUnits() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getUnitsUser-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      user?.units = utf8.decode(answer.sublist(2));
    }).asFuture();
  }

  static getAverage() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getAverage-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      average = utf8.decode(answer.sublist(2));
    }).asFuture();
  }

  static updateName() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("updateName-${user!.id}-${user!.name}\u0000");
    socket.flush();
  }

  static updateLastname() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("updateLastname-${user!.id}-${user!.lastname}\u0000");
    socket.flush();
  }

  static updatePassword() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("updatePassword-${user!.id}-${user!.password}\u0000");
    socket.flush();
  }

  static removeStudent() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("removeStudent-${user!.id}\u0000");
    socket.flush();
  }

  //----------------------------------------------------------------------------

  static homePageReady() async {
    await getScores();
    await getExercises();
    await getExams();
  }

  static getExercises() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getExercises-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      exercises.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split("  ")) {
          print(parts);
          exercises.add(Assignment(
              parts.split("*")[0], Course(parts.split("*")[1], 0, 0),
              int.parse(parts.split("*")[2])));
          if (parts.split("*")[3] == "true" || parts.split("*")[3] == "true ") {
            exercises[exercises.length - 1].isActive = false;
          }
          if (parts.split("*").length >= 5) {
            exercises[exercises.length - 1].hourLeft = parts.split("*")[4];
          }
          if (parts.split("*").length >= 6) {
            exercises[exercises.length - 1].description = parts.split("*")[5];
          }
          if (parts.split("*").length >= 7) {
            exercises[exercises.length - 1].tDescription = parts.split("*")[6];
          }
        }
      }
      exercises.sort((a, b) => a.deadLine - b.deadLine);
    }).asFuture();
  }

  static getScores() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getScores-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      String temp;
      temp = utf8.decode(answer.sublist(2));
      bestScore = temp.split("-")[0];
      worstScore = temp.split("-")[1];
    }).asFuture();
  }

  static getExams() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getExams-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      exams = utf8.decode(answer.sublist(2));
    }).asFuture();
  }

  static exeDone(Assignment e) async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("exeDone-${user!.id}-${e.course.name}-${e.title}\u0000");
    socket.flush();
  }

  static exeRecord(Assignment e) async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write(
        "exeRecord-${user!.id}-${e.course.name}-${e.title}-${e.hourLeft}-${e.description}-${e.tDescription}\u0000");
    socket.flush();
  }

  //----------------------------------------------------------------------------

  static getClasses() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getClasses-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      classes.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split(" ")) {
          classes.add(Course(parts.split("*")[0], int.parse(parts.split("*")[3]), 0));
          classes[classes.length - 1].teacher = Teacher(parts.split("*")[1], parts.split("*")[2], "", "");
          classes[classes.length - 1].exeLeft = parts.split("*")[4];
          classes[classes.length - 1].topName = parts.split("*")[5].replaceAll("&", " ");
        }
      }
    }).asFuture();
  }

  static Future<String> addCourse(String name) async {
    String temp, s = "";
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("addCourse-${user!.id}-$name\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      print(temp);
      if (temp != "Empty" && temp != "mpty") {
        classes
            .add(Course(temp.split("*")[0], int.parse(temp.split("*")[3]), 0));
        classes[classes.length - 1].teacher =
            Teacher(temp.split("*")[1], temp.split("*")[2], "", "");
        classes[classes.length - 1].exeLeft = temp.split("*")[4];
        classes[classes.length - 1].topName =
            temp.split("*")[5].replaceAll("&", " ");
        s = "";
      } else {
        s = "invalid";
      }
    }).asFuture();
    return s;
  }

  //----------------------------------------------------------------------------

  static getTasks() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getTasks-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      tasks.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split("\$\$")) {
          print(parts);
          tasks.add(Task(
              parts.split("-")[0], parts.split("-")[1],
              parts.split("-")[2], (parts.split("-")[3] == "true") ? true : false));
          if (parts.split("-")[4] == "true") {
            tasks[tasks.length - 1].isDone = true;
          }
        }
      }
    }).asFuture();
  }

  static addTask(Task task) async {
    tasks.add(task);
    if (task.minute.length == 1) {
      task.minute = "0${task.minute}";
    }
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("addTask-${user!.id}-${task.title}-${task.hour}-${task.minute}-${task.isMorning}-${task.isDone}\u0000");
    socket.flush();
  }

  static taskDone(Task task) async {
    tasks.add(task);
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("taskDone-${user!.id}-${task.title}\u0000");
    socket.flush();
  }

  //----------------------------------------------------------------------------

  static newsPageReady() async {
    await getDates();
    await getChanges();
  }

  static getDates() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getDates\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      dates.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split("\$")) {
          dates.add(parts);
        }
      }
    }).asFuture();
  }

  static getChanges() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getChanges-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = utf8.decode(answer.sublist(2));
      changes.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split("\$")) {
          changes.add(parts);
        }
      }
    }).asFuture();
  }
}