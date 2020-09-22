import 'package:flutter/material.dart';
import 'package:flutterappbtvn/student.dart';

class InsertStudentScreen extends StatefulWidget {
  static const routName = "/add";

  const InsertStudentScreen({Key key}) : super(key: key);
  @override
  _InsertStudentScreenState createState() => _InsertStudentScreenState();
}

class _InsertStudentScreenState extends State<InsertStudentScreen> {
  var nameTextController = TextEditingController();
  var subjectTextController = TextEditingController();
  var scoreTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var argument = ModalRoute.of(context).settings.arguments;
    if (argument != null) {
      final Student student = argument;
      nameTextController.text = student.name;
      subjectTextController.text = student.subject;
      scoreTextController.text = student.point.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    var student = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(student == null ? "Insert student" : "Update student",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey.withAlpha(50),
                      filled: true,
                      hintText: "User name",
                      hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 15,)
                  ),
                  controller: nameTextController,
                ),
                SizedBox(height: 32,),
                TextField(
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey.withAlpha(50),
                      filled: true,
                      hintText: "Subject",
                      hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 15,)
                  ),
                  controller: subjectTextController,
                ),
                SizedBox(height: 32,),
                TextField(
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      fillColor: Colors.grey.withAlpha(50),
                      filled: true,
                      hintText: "Score",
                      hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
                      contentPadding: EdgeInsets.only(left: 15,)
                  ),
                  controller: scoreTextController,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: Colors.greenAccent,
                      disabledColor: Colors.greenAccent,
                      child: Text(student == null ? "Insert" : "Update"),
                      onPressed: () {
                        var name = nameTextController.text;
                        var subject = subjectTextController.text;
                        var score = double.parse(scoreTextController.text) ?? 0.0;
                        Navigator.of(context).pop(Student(name,subject,score));
                      },
                    ),
                    SizedBox(width: 20,),
                    RaisedButton(
                        color: Colors.greenAccent,
                        disabledColor: Colors.greenAccent,
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}