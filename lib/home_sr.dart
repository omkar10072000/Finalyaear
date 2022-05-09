import 'package:fluid/HOD/request.dart';
import 'package:fluid/LIST/approve.dart';
import 'package:fluid/LIST/reject.dart';
import 'package:fluid/SD/requestlist.dart';
import 'package:flutter/material.dart';

class home_sr extends StatefulWidget {
  @override
  _home_srState createState() => _home_srState();
}

class _home_srState extends State<home_sr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Welcome ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Senior \nmanagment',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 10.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem(
                              Icon(Icons.assignment), 'Request List', "2"),
                          _buildFoodItem(
                              Icon(Icons.verified_outlined), 'Apporov', "3"),
                          _buildFoodItem(
                              Icon(Icons.subscript_rounded), 'Reject', "4")
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(Icon i, String foodName, String p) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.blueAccent[300],
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: InkWell(
              onTap: () {
                if (p == "1") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateNewTaskPage()));
                }

                if (p == "2") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => List()));
                }
                if (p == "3") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => approvelist()));
                }
                if (p == "4") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => rejectlist()));
                }
              },
              child: Container(
                color: Colors.blueAccent[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(15.0),
                        color: Colors.blue,
                        child: Row(children: [
                          Hero(tag: i, child: i),
                          SizedBox(width: 50.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(foodName,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold)),
                              ])
                        ])),
                  ],
                ),
              ))),
    );
  }
}
