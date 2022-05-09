import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluid/HOD/request.dart';
import 'package:fluid/SD/requestlist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SR2 extends StatelessWidget {
  String from;
  String end;
  String ID;
  String shift;
  String name;
  String reason;
  String date;
  String d;
  String total;
  var totalss;
  Map<String, dynamic> User = {
    "name": "",
    "from": "",
    "end": "",
    "ID": "",
    "shift": "",
    "Department": "",
    "reason": "",
    "date": "",
    "total": "",
  };
  SR2(this.name, this.from, this.end, this.ID, this.shift, this.d, this.reason,
      this.date, this.total) {
    User = {
      "name": name,
      "from": from,
      "end": end,
      "ID": ID,
      "shift": shift,
      "Department": d,
      "reason": reason,
      "date": date,
      "total": total,
    };
    print("\n\n\n\n\n\n\n");
    print(total);
    totalss = int.parse(total);
    assert(totalss is int);
    //print(totalss); // 12345
  }
  //static final String path = "lib/src/pages/profile/profile3.dart";
  // final image = avatars[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  d,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),

                              // style: Theme.of(context).textTheme.title,

                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text("Employee Name"),
                                subtitle: Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[Text("From"), Text(from)],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[Text("TO"), Text(end)],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text("Total Hours"),
                                  Text(total)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //this code is to add image of employee
                  /* Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://fluidcontrols.com/wp-content/uploads/2018/07/fc-logo.jpg"),
                            fit: BoxFit.cover)),
                    margin: EdgeInsets.only(left: 16.0),
                  ),*/
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Employee information"),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Employee ID"),
                      subtitle: Text(ID),
                      leading: Icon(Icons.assignment_ind_rounded),
                    ),
                    ListTile(
                      title: Text(shift),
                      //subtitle: Text("9.00 TO 5.00"),
                      leading: Icon(Icons.timer_sharp),
                    ),
                    ListTile(
                      title: Text("DEPARTMENT"),
                      subtitle: Text(d),
                      leading: Icon(Icons.web),
                    ),
                    ListTile(
                      title: Text("Reason"),
                      subtitle: Text(
                        reason,
                      ),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text(" Date"),
                      subtitle: Text(date),
                      leading: Icon(Icons.calendar_view_day),
                    ),
                    Row(children: [
                      SizedBox(width: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                            color: Colors.red[500],
                            highlightColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('Request')
                                  .doc(name)
                                  .delete();

                              await FirebaseFirestore.instance
                                  .collection("Reject")
                                  .doc(name)
                                  .set(User);
                              Navigator.of(context).pop();
                              /*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => List()));*/
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "REJECT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            )),
                      ),
                      SizedBox(width: 5.0),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
