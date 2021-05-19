import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:the_laptop_hub_3/app_screens/login.dart';
import 'addSuggestions.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
class UpdatesScreen extends StatefulWidget{
  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  List<dynamic>updatesList = List(); //as Map<String, dynamic>;
  // List listResponse;
  // String stringResponse;
  // Map mapResponse;
  var _currentIndex = 0;
  final tabs = [
    Container(child:Home()),
    Container(child:UpdatesScreen())
  ];

   initState()  {
     fetchData();
    super.initState();
  }

   Future fetchData()async{

    String url = 'https://newsapi.org/v2/everything?domains=techcrunch.com&sortBy=publishedAt&apiKey=b8010d33c3224b96b552b75eb026e1ca';
    Response response = await get(url);
    var responseBody = response.body;
    Map list = json.decode(responseBody);
    if( response.statusCode==200){
      updatesList.add(list['articles'][2]);
    }else{
      print(updatesList);
    }

    return updatesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text(
          "UPDATES SCREEN",
          style: TextStyle(

          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout),
              onPressed: (){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
          builder: (context) => Login(),
                ));              
                }
          )
        ],
      ),
      body: updatesList.isEmpty||updatesList==null?CircularProgressIndicator():ListView.builder(
          //itemCount: updatesList.length,
        itemBuilder: (context, int index){
        return Container(
            decoration: BoxDecoration(
              color: HexColor('#cc99cc')
            ),
            child: Card(
              color: HexColor('#ffffff'),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                child: Column(
                  children: [
                    ListTile(
                      onTap: (){},
                      title: Text(
                         'TITLE: ${updatesList?.elementAt(2)}',
                        style: TextStyle(
                          fontSize: 20
                        )
                      ),
                      subtitle: Text(
                        '${updatesList?.elementAt(3)}'
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('images/laptopimage_1.jpg'),
                      ),
                    ),
                  ],
                )
              ),
            ),
          );
      },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.laptop),
              title: Text("Suggestions"),
              backgroundColor: Colors.black45
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.update),
              title: Text("Updates"),
              backgroundColor: Colors.black45
          ),
        ],
        onTap: (index){
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        onPressed: (){
          navigateToAddSuggestions(context);
        },
      ),
    );
  }
  void navigateToAddSuggestions(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> AddSuggestions(),
        )
    );
  }

}

