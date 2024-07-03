import 'package:ap_project_frontend/classes/course.dart';

class Teacher {

  final String name;

  final String lastname;

  final String username;

  final String? password;

  final List<Course> courses = [];

  Teacher(this.name, this.lastname, this.username, this.password);

}