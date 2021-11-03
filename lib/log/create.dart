import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Color orangeColors = Color(0xffF5591F);
Color orangeLightColors = Color(0xffF2861E);

class SignupThreePage extends StatefulWidget {
//  static final String path = "lib/src/pages/login/signup3.dart";

  @override
  _SignupThreePageState createState() => _SignupThreePageState();
}

class _SignupThreePageState extends State<SignupThreePage> {
  void signup(String emails, String passwords, String position) async {
    Firebase.initializeApp().whenComplete(() {});
    UserCredential? credential;
    print("====\n====\n===\n===\n==\n==\n==\n" +
        emails +
        "\n\\n\n\n" +
        passwords);
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emails, password: passwords);
    } on FirebaseAuthException catch (ex) {
      print("\n\n\n exeption ===>   \n\n" + ex.code.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;
      Map<String, dynamic> User = {
        "name": emails,
        "password": passwords,
        "position": position
      };
      await FirebaseFirestore.instance
          .collection('user')
          .doc(emails)
          .set(User)
          .then((value) => print("\n\n\nNew User Create"));
    }
    print("credential===>");
    print(credential);
  }

  @override
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController name = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Signup For Free"),
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
                        controller: name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "FullName",
                          prefixIcon: Icon(Icons.person),
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
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_sharp),
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
                        controller: position,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Position",
                          prefixIcon: Icon(Icons.person_pin_sharp),
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
                        controller: password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Passwaord",
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "SIGNUP",
                          onClick: () {
                            // setState(() {

                            // });
                            signup(email.text.trim(), password.text.trim(),
                                position.text.trim().toLowerCase());
                            print("\n\n]n\n==========");
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "SIGNIN",
                            style: TextStyle(color: orangeColors)),
                      ]),
                    )
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
  var text = "Signin";

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
                radius: 70, backgroundImage: NetworkImage('images/l.jpg')),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String? btnText = "";
  var onClick;

  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
