import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'approve.dart';

class rejectlist extends StatefulWidget {
  const rejectlist({Key? key}) : super(key: key);

  @override
  _rejectlistState createState() => _rejectlistState();
}

Widget buildlist(String name, String dep) {
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
                          color: Colors.black, fontSize: 9, letterSpacing: .3)),
                ],
              ),
              SizedBox(
                height: 0,
              )
            ],
          ),
        )
      ],
    ),
  );
}

class _rejectlistState extends State<rejectlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reject List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Reject").snapshots(),
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
                          return InkWell(
                              onTap: () {}, child: buildlist(name, dep));
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
