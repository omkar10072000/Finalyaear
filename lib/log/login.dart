import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluid/HOD/request.dart';
import 'package:fluid/HR/list.dart';
import 'package:fluid/SD/requestlist.dart';
import 'package:fluid/home.dart';
import 'package:fluid/home_sr.dart';
import 'package:fluid/log/Reset.dart';
import 'package:fluid/main.dart';
import 'package:flutter/material.dart';
import 'package:fluid/log/create.dart';

Color orangeColors = Color(0xffF5591F);
Color orangeLightColors = Color(0xffF2861E);

class Login extends StatefulWidget {
  static final String path = "lib/src/pages/login/login14.dart";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pasward = TextEditingController();
    String E_EMAIL = "ENTER EMAIL";
    String E_PASSWORD = "ENTER PASSWORD";
    Color c = Colors.grey;
    void login(String emails, String passwords) async {
      UserCredential? credential;

      try {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emails, password: passwords);
      } on FirebaseAuthException catch (ex) {
        print("\n\n\nERROR\n\n =>  \n" + ex.message.toString());
      }
      print("\n\n\nEmails =>  " + emails + "\n\n" + passwords);
      print(credential);
      if (credential != null) {
        String uid = credential.user!.uid;
        DocumentSnapshot data = await FirebaseFirestore.instance
            .collection('user')
            .doc(emails)
            .get();
        String p = data['position'];
        print("\n\n\n\n LOGIN SUCCEFULL \n\n");
        print(credential.user!.email);
        if (p == "senior management") {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home_sr()));
        }
        if (p == "hod") {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home_hod()));
        }
        if (p == "hr") {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => hrlist()));
        }
      } else {
        print("\n\n\n\n\n\n\n\n\n\n==========");
        print(credential);
      }
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          //physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: E_EMAIL,
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: pasward,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: c,
                          hintText: E_PASSWORD,
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => reset()));
                        },
                        child: Text(
                          "Forgot Password?",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "SIGN IN",
                          onClick: () {
                            print(
                                "\n\n\n\n\n\n\n\n\n\nokokokokomkmk\n\n\n\n\n\n\n");
                            print(email.text.trim());
                            print(
                                "\n\n\n\n\n\n\n\n\n\nokokokokomkmk\n\n\n\n\n\n\n");
                            setState(() {
                              E_EMAIL = email.text.trim();
                            });
                            if (email.text.trim() == "") {
                              print(
                                  "\n\n\n\n\n\n\n\n\n\nokokokokomkmk\n\n\n\n\n\n\n");
                              setState(() {
                                E_EMAIL = "WRONG / INCORRECT ENTRY";
                                c = Colors.red;
                              });
                            } else if (email.text.trim() == "") {
                              E_PASSWORD = "WRONG / INCORRECT ENTRY";
                            } else
                              login(email.text.trim(), pasward.text.trim());
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(children: [
                      Text("Don't have an account ? ",
                          style: TextStyle(color: Colors.black)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupThreePage()));
                        },
                        child: Text("Signup",
                            style: TextStyle(color: orangeColors)),
                      ),
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://fluidcontrols.com/wp-content/uploads/2018/07/fc-logo.jpg')),
          ),
        ],
      ),
    );
  }
}
