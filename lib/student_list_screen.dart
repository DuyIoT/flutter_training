import 'package:flutter/material.dart';
import 'package:flutterappbtvn/insert_student_screen.dart';
import 'package:flutterappbtvn/student.dart';
import 'package:flutterappbtvn/student_item.dart';

class StudentListScreen extends StatefulWidget {
  static const routName = "/list";

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _listScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var argument = await Navigator.of(context)
              .pushNamed(InsertStudentScreen.routName, arguments: null);
          if (argument != null) {
            students.add(argument);
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _listScreen() {
    return ListView.builder(
        itemBuilder: (context, index) => StudentItems(
              student: students[index],
              onClick: (student) async {
                var argument = await Navigator.of(context).pushNamed(
                    InsertStudentScreen.routName,
                    arguments: students[index]);
                if (argument != null) {
                  setState(() {
                    students[index] = argument;
                  });
                }
              },
              onClickDelete: (student) async {
                setState(() {
                  students.removeAt(index);
                });
              },
            ),
        itemCount: students.length);
  }
}
