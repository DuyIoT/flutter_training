import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterappbtvn/student.dart';

class StudentItems extends StatefulWidget {
  Student student;
  Function(Student student) onClick;
  Function(Student student) onClickDelete;

  StudentItems({Key key, this.student, this.onClick, this.onClickDelete})
      : super(key: key) {
    print("constructor: ${student.name}");
  }

  @override
  _StudentItemsState createState() => _StudentItemsState();
}

class _StudentItemsState extends State<StudentItems> {
  var colors = [Colors.red, Colors.green, Colors.yellow, Colors.blue];

  var indexColor = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onClick(widget.student);
      },
      onLongPress: () {
        _showDialogDelete();
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: colors[indexColor]),
                  child: Text(widget.student.name.substring(0, 1),
                      style: TextStyle(fontSize: 20, color: Colors.white))),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.student.name,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(widget.student.subject, style: TextStyle(fontSize: 14))
                ],
              ),
              Spacer(),
              Text(widget.student.point.toString(),
                  style: TextStyle(fontSize: 28, color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogDelete() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want delete student?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onClickDelete(widget.student);
              },
            ),
          ],
        );
      },
    );
  }
}
