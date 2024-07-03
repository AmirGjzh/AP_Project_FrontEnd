import 'package:ap_project_frontend/classes/course.dart';

class Student {
  String name;

  String lastname;

  String id;

  String password;

  int units = 0;

  final List<Course> courses = [];

  Student(this.name, this.lastname, this.id, this.password);


}