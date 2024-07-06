import 'dart:convert';
import 'dart:io';

import 'package:ap_project_frontend/classes/assignment.dart';
import 'package:ap_project_frontend/classes/course.dart';
import 'package:ap_project_frontend/classes/student.dart';
import 'package:ap_project_frontend/classes/task.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/classes_page.dart';

class User {
  static const String IP = "192.168.1.208";
  static Student? user;
  static late String average;
  static late String bestScore;
  static late String worstScore;
  static List<Assignment> exercises = [];
  static List<Course> classes = [];
  static List<Task> tasks = [];

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
      user?.units = const Utf8Decoder().convert(answer);
    }).asFuture();
  }

  static getAverage() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getAverage-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      average = const Utf8Decoder().convert(answer);
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
  }

  static getExercises() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getExercises-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = const Utf8Decoder().convert(answer);
      exercises.clear();
      if (temp != "Empty" && temp != "mpty") {
        for (String parts in temp.split(" ")) {
          print(parts);
          exercises.add(Assignment(
              parts.split("*")[0], Course(parts.split("*")[1], 0, 0),
              int.parse(parts.split("*")[2])));
          if (parts.split("*")[3] == "true") {
            exercises[exercises.length - 1].isActive = false;
          }
        }
      }
    }).asFuture();
  }

  static getScores() async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getScores-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      String temp;
      temp = const Utf8Decoder().convert(answer);
      print(temp);
      bestScore = temp.split("-")[0];
      worstScore = temp.split("-")[1];
    }).asFuture();
  }

  static exeDone(Assignment e) async {
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("exeDone-${user!.id}-${e.course.name}-${e.title}\u0000");
    socket.flush();
  }

  //----------------------------------------------------------------------------

  static getClasses() async {
    String temp;
    Socket socket = await Socket.connect(IP, 1384);
    socket.write("getClasses-${user!.id}\u0000");
    socket.flush();
    await socket.listen((answer) async {
      temp = const Utf8Decoder().convert(answer);
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
      temp = const Utf8Decoder().convert(answer);
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
      temp = const Utf8Decoder().convert(answer);
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
}