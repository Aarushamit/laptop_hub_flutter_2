import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:the_laptop_hub_3/app_screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_laptop_hub_3/app_screens/updateScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String emailId = '';
  String userName = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: 900,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: Image.asset(
                  "images/laptop_images_4.jpg",
                      fit: BoxFit.contain
              )
            ),
            Positioned(
              top: 280,
                left: 50,
                right: 50,
                child: Text(
              "NEW HERE? SIGN UP!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'Girassol',
                fontWeight: FontWeight.w500
              ),
            )),

            Positioned(
              top: 350,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        maxLength: 15,
                        maxLengthEnforced: true,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          fillColor: HexColor('#cc99cc'),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: 'enter your user name',
                          hintStyle: TextStyle(color: Colors.black),
                          icon: Icon(Icons.verified_user),
                        ),
                        keyboardType: TextInputType.name,
                        onChanged: (val) {
                          setState(() {
                            userName = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            fillColor: HexColor('#cc99cc'),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            hintText: 'enter your email ID',
                            hintStyle: TextStyle(color: Colors.black),
                            icon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            setState(() {
                              emailId = val;
                            });
                          },
                          validator: (val) {
                            return val.contains('@')
                                ? null
                                : 'please enter a valid email';
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            fillColor: HexColor('#cc99cc'),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            hintText: 'enter your password',
                            hintStyle: TextStyle(color: Colors.black),
                            icon: Icon(Icons.admin_panel_settings_outlined),
                          ),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 14.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.blueGrey,
                          onPressed:  () async{
                            final snackBar = SnackBar(
                              content: Text('YAY! WELCOME TO THE COMMUNITY!'),
                              action: SnackBarAction(
                                label: 'close this message',
                                onPressed: () {

                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            // try {
                            //   await FirebaseAuth.instance
                            //       .createUserWithEmailAndPassword(
                            //           email: emailId, password: password);
                             signup(context);
                            // // await userSetup();
                            // } catch (e) {
                            //   return e.message;
                            // }
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signup(BuildContext context) {
   Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UpdatesScreen(),
        ));
        
  }

  // }
  // Future<void> userSetup() async {
  //   CollectionReference users = FirebaseFirestore.instance.collection('Users');
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   String uid = auth.currentUser.uid.toString();
  //   await users.add(
  //       {'email_id': emailId, 'user_name': userName, 'user_identifier': uid});
  //       print("user added to db");
  //       return;
  // }
}
