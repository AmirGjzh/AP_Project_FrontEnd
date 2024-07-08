import 'package:ap_project_frontend/classes/course.dart';

class Assignment {

  final String title;

  final Course course;

  int deadLine;

  bool isActive = true;

  String hourLeft = "";

  String description = "";

  String tDescription = "";

  String deadLine2 = "";

  Assignment(this.title, this.course, this.deadLine) {
   deadLine2 += "${(deadLine / 1440).floor()} : ";
   deadLine %= 1440;
   deadLine2 += (deadLine / 60 >= 10) ? "${(deadLine /60).floor()} : " : "0${(deadLine /60).floor()} : ";
   deadLine %= 60;
   deadLine2 += (deadLine >= 10) ? "$deadLine" : "0$deadLine";
  }
}