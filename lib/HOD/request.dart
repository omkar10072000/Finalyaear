import 'package:fluid/SD/requestlist.dart';
import 'package:flutter/material.dart';
import 'package:fluid/SD/approve.dart';
import 'package:fluid/theme/colors/light_colors.dart';
import 'package:fluid/widgets/top_container.dart';
import 'package:fluid/widgets/back_button.dart';
import 'package:fluid/widgets/my_text_field.dart';
import 'package:fluid/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateNewTaskPage extends StatelessWidget {
  void upload(String name, String from, String end, String ID, String shift,
      String department, String reason, String date) async {
//      String uid = credential.user!.uid;
    Map<String, dynamic> User = {
      "name": name,
      "from": from,
      "end": end,
      "ID": ID,
      "shift": shift,
      "Department": department,
      "reason": reason,
      "date": date
    };
    await FirebaseFirestore.instance
        .collection("Request")
        .doc(name)
        .set(User)
        .then((value) => print("\n\n\nNew User Create"));
    // print("credential===>");
    //  print(credential);
  }

  @override
  TextEditingController _name = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _shift = TextEditingController();
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();
  TextEditingController _total = TextEditingController();
  TextEditingController _reason = TextEditingController();
  TextEditingController _dapartment = TextEditingController();
  var c = Colors.cyan;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    var c2 = c;
    var c3 = c;
    var c4 = c;
    var c5 = c;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  MyBackButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create new Request',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _name,
                        style: TextStyle(color: Colors.black87),
                        minLines: 1,
                        maxLines: 1,
                        decoration: InputDecoration(
                            //  suffixIcon: icon == null ? null: icon,
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.black45),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _date,
                              style: TextStyle(color: Colors.black87),
                              minLines: 1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  //  suffixIcon: icon == null ? null: icon,
                                  labelText: "Date",
                                  labelStyle: TextStyle(color: Colors.black45),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey))),
                            ),
                          ),
                          HomePage.calendarIcon(),
                        ],
                      ),
                      TextField(
                        controller: _shift,
                        style: TextStyle(color: Colors.black87),
                        minLines: 1,
                        maxLines: 1,
                        decoration: InputDecoration(
                            //  suffixIcon: icon == null ? null: icon,
                            labelText: "Regular Shift",
                            labelStyle: TextStyle(color: Colors.black45),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        controller: _start,
                        style: TextStyle(color: Colors.black87),
                        minLines: 1,
                        maxLines: 1,
                        decoration: InputDecoration(
                            //  suffixIcon: icon == null ? null: icon,
                            labelText: "Start Time",
                            labelStyle: TextStyle(color: Colors.black45),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      )),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _end,
                          style: TextStyle(color: Colors.black87),
                          minLines: 1,
                          maxLines: 1,
                          decoration: InputDecoration(
                              //  suffixIcon: icon == null ? null: icon,
                              labelText: "End Time",
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: _total,
                          style: TextStyle(color: Colors.black87),
                          minLines: 1,
                          maxLines: 1,
                          decoration: InputDecoration(
                              //  suffixIcon: icon == null ? null: icon,
                              labelText: "Total Time",
                              labelStyle: TextStyle(color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _reason,
                    style: TextStyle(color: Colors.black87),
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                        //  suffixIcon: icon == null ? null: icon,
                        labelText: "Reason for extra working ",
                        labelStyle: TextStyle(color: Colors.black45),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Department',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //direction: Axis.vertical,
                          alignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          runSpacing: 10,
                          //textDirection: TextDirection.rtl,
                          spacing: 10.0,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  _dapartment.text = "IT DEPARTMENT";
                                  c = Colors.blue;
                                },
                                child: Chip(
                                  label: Text("IT DEPARTMENT"),
                                  backgroundColor: c,
                                  labelStyle: TextStyle(color: Colors.white),
                                )),
                            InkWell(
                                onTap: () {
                                  _dapartment.text = "COMPUTER DEPARTMENT";
                                  c2 = Colors.blue;
                                },
                                child: Chip(
                                  backgroundColor: c2,
                                  label: Text("COMPUTER DEPARTMENT"),
                                  labelStyle: TextStyle(color: Colors.white),
                                )),
                            InkWell(
                                onTap: () {
                                  _dapartment.text = "ENTC DEPARTMENT";
                                  c3 = Colors.blue;
                                },
                                child: Chip(
                                  backgroundColor: c3,
                                  label: Text("ENTC DEPARTMENT"),
                                  labelStyle: TextStyle(color: Colors.white),
                                )),
                            InkWell(
                                onTap: () {
                                  _dapartment.text = "MECHANICAL DEPARTMENT";
                                  c4 = Colors.blue;
                                },
                                child: Chip(
                                  backgroundColor: c4,
                                  label: Text("MECHANICAL DEPARTMENT"),
                                  labelStyle: TextStyle(color: Colors.white),
                                )),
                            InkWell(
                                onTap: () {
                                  _dapartment.text = "CIVIL DEPARTMENT";
                                  c5 = Colors.blue;
                                },
                                child: Chip(
                                  backgroundColor: c5,
                                  label: Text("CIVIL DEPARTMENT"),
                                  labelStyle: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Container(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      upload(
                        _name.text.trim(),
                        _start.text.trim(),
                        _end.text.trim(),
                        _name.text.trim(),
                        _shift.text.trim(),
                        _dapartment.text.trim(),
                        _reason.text.trim(),
                        _date.text.trim(),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => List()));
                    },
                    child: Container(
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: LightColors.kBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
