import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signupScreen.dart';
import 'login.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _pageState = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double loginYOffset = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "THE LAPTOP HUB",
                  style: TextStyle(
                      color: Colors.black, decoration: TextDecoration.none),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "WANT TO EXPAND YOUR LAPTOP KNOWLEDGE? BUYING A NEW LAPTOP? WE GOT YOU!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(child: Image.asset('images/laptopimages.gif')),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: SizedBox(
              width: 400,
              height: 70,
              child: RaisedButton(
                color: HexColor('#b2d8d8'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70)),
                onPressed: () {loginNavigation(context);},
                child: Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// class LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250.0,
//       height: 50.0,
//       margin: EdgeInsets.only(top: 25.0),
//       child:
//     );
//   }

void loginNavigation(BuildContext context) {
  Navigator.push(
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
          return Login();
        }),
  );
}
