import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_laptop_hub_3/app_screens/home.dart';
import 'package:hexcolor/hexcolor.dart';

import 'signupScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> with SingleTickerProviderStateMixin{
  var email = '';
  var password = '';
  var _formkey = GlobalKey<FormState>();
  Animation<double> containerSize;
  @override
  void initState(){
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
                  'images/laptop_images_3.jpg',
                  fit: BoxFit.contain
                )
            ),
            Positioned(
              top: 270,
              right: 50,
              left: 50,
                child: Text(
                "SIGN IN HERE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black,
                      fontFamily: 'Girassol',
                      fontWeight: FontWeight.w500,
                      fontSize: 25.0
                )
            )
            ),
            Positioned(
              top: 350,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 400,
                        child: Form(
                          key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                        style: TextStyle(
                            color:  Colors.black
                        ),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          fillColor: HexColor('#cc99cc'),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,

                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          hintText: 'enter your email ID',
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          icon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (val){
                          return val.contains('@')?null:'please enter a valid email';
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 50.0),
                              child: SizedBox(
                        width: 400,
                        child: TextFormField(
                        style: TextStyle(
                            color:  Colors.black
                        ),
                        decoration: InputDecoration(
                          focusColor: Colors.black,
                          fillColor: HexColor('#cc99cc'),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          hintText: 'enter your password',
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
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
                      
                      Padding(padding: EdgeInsets.all(50.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child:RaisedButton(
                        elevation: 14.0,
                        shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                        color: Colors.blueGrey,
                        onPressed: ()async {
                         try{
                            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                            
                         } catch(e){
                          return e.message;
                         }
                         
                          signIn(context);
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ),
                      ),
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),

               ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0)
                ),
                color: Colors.black26
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                signup(context);
              },
              child: Text(
                "No account yet? Feel free to sign up!",
                style: TextStyle(
                    color: HexColor('#008080'),
                    fontSize: 18
                ),
              ),
            ),
          ),
        ),
          ],
        ),
        ),
      );
  }


  void signIn(BuildContext context) {
      if(_formkey.currentState.validate()&&password.isNotEmpty){
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
      }
    //}
  }
  void signup(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, animationTime, child) {
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationTime) {
            return SignupScreen();
          }),
    );
  }
}



