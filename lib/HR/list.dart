import 'package:fluid/HR/display.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

String name = "";

class hrlist extends StatefulWidget {
  const hrlist({Key? key}) : super(key: key);

  @override
  _hrlistState createState() => _hrlistState();
}

Widget buildhrlist(String name) {
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
                  Text(name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          letterSpacing: .3)),
                ],
              ),
              SizedBox(
                height: 6,
              )
            ],
          ),
        )
      ],
    ),
  );
}

class _hrlistState extends State<hrlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Text("Request List"),
        actions: [
          InkWell(
            onTap: () async {
              var collection = FirebaseFirestore.instance.collection('Approve');
              var snapshots = await collection.get();
              for (var doc in snapshots.docs) {
                await doc.reference.delete();
              }
              var collection1 = FirebaseFirestore.instance.collection('Total');
              var snapshots1 = await collection1.get();
              for (var doc in snapshots1.docs) {
                await doc.reference.delete();
              }
              var collection2 = FirebaseFirestore.instance.collection('Reject');
              var snapshots2 = await collection2.get();
              for (var doc in snapshots2.docs) {
                await doc.reference.delete();
              }
            },
            child: Card(
              //margin: const EdgeInsets.all(14.0),
              color: Colors.redAccent,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  "  Reset \n all data",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Total").snapshots(),
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
                          int total = m[index]['total'];
                          var name2 = m[index]["name"];
                          String dep;
                          print("\n\n\n\n\n\n\n");
                          print(total);
                          return InkWell(
                              onTap: () async {
                                String n = name2;
                                DocumentSnapshot datass =
                                    await FirebaseFirestore.instance
                                        .collection('Approve')
                                        .doc(n)
                                        .get();
                                String name = datass["name"];
                                String id = datass["ID"];
                                String shift = datass["shift"];
                                dep = datass["Department"];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => display_infor(
                                            name,
                                            id,
                                            dep,
                                            shift,
                                            total.toString())));
                              },
                              child: buildhrlist(name2));
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
