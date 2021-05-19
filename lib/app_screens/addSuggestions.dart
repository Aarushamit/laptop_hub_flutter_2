import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
class AddSuggestions extends StatefulWidget {
  @override
  _AddSuggestionsState createState() => _AddSuggestionsState();
}

class _AddSuggestionsState extends State<AddSuggestions> {
  String laptopName = '';
  String processorAndRam = '';
  String graphicsCard = '';
  String userExp;
  String userType = '';
  String buyingLink = '';
  var _formkey = GlobalKey<FormState>();
final nameHolder = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
            "ADD SUGGESTIONS",
            style: TextStyle(
                color: Colors.white
            ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout),
              onPressed: (){
            print("LOGOUT PRESSED");
              }
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor('#cc99cc'), HexColor('#ffffff')],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (val){
                    return val.isEmpty?'please enter some text': null;
                },
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'what is the laptop name?',
                  hintStyle: TextStyle(
                      color: Colors.black,
                          fontSize: 20.0
                  ),
                ),
                maxLength: 25,
                maxLengthEnforced: true,
                onChanged: (val) {
                  setState(() {
                    laptopName = val;
                  });
                },
              ),
              TextFormField(
                validator: (val){
                    return val.isEmpty?'please enter some text': null;
                },
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'please specify CPU and RAM',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                ),
                // maxLength: 10,
                // maxLengthEnforced: true,
                onChanged: (val) {
                  setState(() {
                    processorAndRam = val;
                  });
                },
              ),
              TextFormField(
                validator: (val){
                    return val.isEmpty?'please enter some text': null;
                },
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'please specify the graphics card type, model and VRAM capacity',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                ),
                maxLength: 15,
                maxLengthEnforced: true,
                onChanged: (val) {
                  setState(() {
                    graphicsCard = val;
                  });
                },
              ),
              TextFormField(
                validator: (val){
                    return val.isEmpty?'please enter some text': null;
                },
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'what type of laptop is it? Ex: gaming/office',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                ),
                maxLength: 25,
                maxLengthEnforced: true,
                onChanged: (val) {
                  setState(() {
                    userType = val;
                  });
                },
              ),
              Container(
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'how was your experience?',
                    hintStyle: TextStyle(
                      color: Colors.black,
                        fontSize: 20.0
                    ),
                  ),
                  maxLines: 1,
                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],


                validator: (val){
                    return val.isEmpty?'please enter some text': null;
                },
                  onChanged: (val) {
                    setState(() {
                      userExp = val;
                    });
                  },

                ),

              ),
                TextFormField(
                   keyboardType: TextInputType.url,
                  style: TextStyle(
                      color: Colors.blue
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'paste the link to buy the laptop',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                    ),
                  ),
                  maxLines: null,
                  onChanged: (val) {
                    setState(() {
                      buyingLink = val;
                    });
                  },
                ),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ButtonTheme(
                          minWidth: 300.0,
                          height: 70.0,
                          child:RaisedButton(
                          elevation: 14.0,
                          shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                          color: Colors.blueGrey,
                          onPressed: () async{
                            try{
                                await addSuggestion();
                            }catch(e){
                              return e.message;
                            }
                          },
                          child: Text(
                            "ADD SUGGESTION",
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
    );
  }
  validating(){
    if(_formkey.currentState.validate()){
         return 'great!';
      }
  }
  Future<void> addSuggestion() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser.uid.toString();
    CollectionReference suggestions = FirebaseFirestore.instance.collection('suggestions');
    await suggestions.add(
        {
          'laptop_name': laptopName, 
          'processor_and_ram': processorAndRam,
           'graphics_card': graphicsCard,
           'user_type': userType,
           'rating_out_of_10':  userExp,
           'buying_link': buyingLink,
           'user_identifier': uid
        });
        print("suggestion added to db");
        return;
  }
   clearTextInput(){

    nameHolder.clear();

  }
}

