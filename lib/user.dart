import 'dart:io';

import 'package:ap_project_frontend/classes/student.dart';

class User {
  static const String IP = "";
  static Student? user;
  static String average = "00.00";
  static String numberOfExercises = "0";
  static String bestScore = "00.00";
  static String worstScore = "00.00";

  static void setUser(String name, String lastname, String id, String password) async {
    setUnits();
    getAverage();
    getNumberOfExercises();
    getBestScore();
    getWorstScore();
    user = Student(name, lastname, id, password);
  }

  static void setUnits() {
    Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("getUnitsUser-${user!.id}");
      serverSocket.flush();
      serverSocket.listen((answer) {
        user!.units = int.parse(String.fromCharCode(answer as int));
      });
    });
  }

  static void getAverage() {
    Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("getAverage-${user!.id}");
      serverSocket.flush();
      serverSocket.listen((answer) {
        average = String.fromCharCode(answer as int);
      });
    });
  }

  static void getBestScore() {
    Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("getBestScore-${user!.id}");
      serverSocket.flush();
      serverSocket.listen((answer) {
        bestScore = String.fromCharCode(answer as int);
      });
    });
  }
  static void getWorstScore() {
    Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("getWorstScore-${user!.id}");
      serverSocket.flush();
      serverSocket.listen((answer) {
        worstScore = String.fromCharCode(answer as int);
      });
    });
  }

  static void getNumberOfExercises() {
    Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("getNumberOfExercises-${user!.id}");
      serverSocket.flush();
      serverSocket.listen((answer) {
        numberOfExercises = String.fromCharCode(answer as int);
      });
    });
  }

  static void updateName() async {
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("updateName-${user!.id}-${user!.name}");
      serverSocket.flush();
    });
  }

  static void updateLastname() async {
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("updateLastname-${user!.id}-${user!.lastname}");
      serverSocket.flush();
    });
  }

  static void updatePassword() async {
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("updatePassword-${user!.id}-${user!.password}");
      serverSocket.flush();
    });
  }

  static void removeStudent() async {
    await Socket.connect("host", 1384).then((serverSocket) {
      serverSocket.write("removeStudent-${user!.id}");
      serverSocket.flush();
    });
  }
}