import 'package:flutter/material.dart';
import 'package:the_laptop_hub_3/app_screens/login.dart';
import 'addSuggestions.dart';
import 'updateScreen.dart';
//import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //final CollectionReference collectionReference = FirebaseFirestore.instance.collection('suggestions');
  var data = FirebaseFirestore.instance.collection('suggestions').snapshots();
  int _currentIndex = 0;
  List<Widget>_widgetOptions = <Widget>[
    Home(),
    UpdatesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text(
            'SEARCH SUGGESTIONS',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout),
              onPressed: ()async {
                try{
                  await FirebaseAuth.instance.signOut();
                  print("successfully signed out");
                }catch(e){
                return e.message;
                }
                
                 Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
              }
          )
        ],
      ),
      body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end:  Alignment.bottomCenter,
           colors: [Colors.black12, Colors.teal]
         )
       ),
        child: Center(
          child: Text(
            "SEARCH SUGGESTION SCREEN",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.laptop),
              title: Text("Suggestions"),
              backgroundColor: Colors.black45
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.update),
              title: Text("Updates"),
              backgroundColor: Colors.grey
          ),

        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.add, size: 50.0),
        hoverElevation: 15.0,
        foregroundColor: Colors.white,

        onPressed: () {
          navigateToAddSuggestions(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }

  void navigateToAddSuggestions(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddSuggestions(),
        )
    );
  }
}