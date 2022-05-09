import 'dart:developer';

import 'package:fluid/HOD/request.dart';
import 'package:fluid/HR/display.dart';
import 'package:fluid/HR/list.dart';
import 'package:fluid/SD/requestlist.dart';
import 'package:fluid/home.dart';
import 'package:fluid/log/login.dart';
import 'package:fluid/log/create.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        minimum: const EdgeInsets.all(6.0),
        child: Container(color: Colors.white, child: Login()),
      ),
    );
  }
}
