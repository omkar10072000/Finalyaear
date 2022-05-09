import 'package:fluid/HOD/rejects.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class List_hod extends StatefulWidget {
  const List_hod({Key? key}) : super(key: key);

  @override
  _List_hodState createState() => _List_hodState();
}

Widget buildList_hod(String name, String dep) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45),
      color: Colors.lightBlue,
    ),
    width: 50,
    height: 110,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.assignment_ind_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(dep,
                      style: TextStyle(
                          color: Colors.black, fontSize: 8, letterSpacing: .3)),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class _List_hodState extends State<List_hod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Request").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                  return Expanded(
                    child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataSnapshot.docs.length,
                        itemBuilder: (context, index) {
                          var m = dataSnapshot.docs;
                          //for(var n in m)
                          //while (i++ < 5) {
                          String name = m[index]['name'];
                          String from = m[index]['from'];
                          String end = m[index]['end'];
                          String date = m[index]['ID'];
                          String dep = m[index]['Department'];
                          String reason = m[index]['reason'];
                          String d = m[index]['date'];
                          String shift = m[index]['shift'];
                          String total = m[index]['total'];
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SR2(
                                              name,
                                              from,
                                              end,
                                              date,
                                              shift,
                                              dep,
                                              reason,
                                              d,
                                              total,
                                            )));
                              },
                              child: buildList_hod(name, dep));
                        }),
                  );
                } else {
                  return Center(
                    child: Text("Say hi to your new friend"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );

                ;
              }
            }),
      ),
    );
  }
}
