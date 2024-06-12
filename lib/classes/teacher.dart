import 'package:ap_project_frontend/classes/course.dart';

class Teacher {

  final String _name;

  final String _lastname;

  final String _username;

  final String? _password;

  final List<Course> _courses = [];

  Teacher(this._name, this._lastname, this._username, this._password);

  List<Course> get courses => _courses;

  String? get password => _password;

  String get username => _username;

  String get lastname => _lastname;

  String get name => _name;


}