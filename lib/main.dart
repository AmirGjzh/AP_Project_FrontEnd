import 'package:ap_project_frontend/classes_page.dart';
import 'package:ap_project_frontend/exercises_page.dart';
import 'package:ap_project_frontend/home_page.dart';
import 'package:ap_project_frontend/information_page.dart';
import 'package:ap_project_frontend/login_page.dart';
import 'package:ap_project_frontend/signup_page.dart';
import 'package:ap_project_frontend/todo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExercisesPage();
  }
}
