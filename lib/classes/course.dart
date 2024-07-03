import 'package:ap_project_frontend/classes/student.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/classes/assignment.dart';

class Course {

  final String name;

  final int units;

  Teacher? teacher;

  final Map<Student, double> students = {};

  bool isActive = false;

  final List<Assignment> exercises = [];

  Assignment? project;

  final int examDate;

  Course(this.name, this.units, this.examDate);

}