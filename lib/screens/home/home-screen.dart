import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/UtubeItem.dart';
import 'package:scalelearninghub/screens/home/chat_rooms.dart';
import 'package:scalelearninghub/screens/home/browser.dart';
import 'package:scalelearninghub/screens/home/education.dart';
import 'package:scalelearninghub/screens/home/entertainment.dart';
import 'package:scalelearninghub/screens/home/games.dart';
import 'package:scalelearninghub/screens/home/youtube.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:scalelearninghub/Config.dart';

class HomeScreen extends StatefulWidget {
  String myaccess ;
  HomeScreen ({required this.myaccess});

  @override
  State<HomeScreen> createState() => _HomeScreenState(myaccess:myaccess);
}

class _HomeScreenState extends State<HomeScreen> {

  _HomeScreenState({required this.myaccess});
  String myaccess ;


  DateTime now = DateTime.now();
  List <Item> myitem =[];

  List items = [
    {
      "itemId": 1,
      "itemname": "YouTube",
      "imagepath": "assets/images/youtube-icon.png"
    },
    {
      "itemId": 2,
      "itemname": "Browser",
      "imagepath": "assets/images/chrome-icon.png"
    },
    {
      "itemId": 3,
      "itemname": "Chatting",
      "imagepath": "assets/images/chat-icon.png"
    },
    {
      "itemId": 4,
      "itemname": "Education",
      "imagepath": "assets/images/education-icon.png"
    },
    {
      "itemId": 5,
      "itemname": "Entertainment",
      "imagepath": "assets/images/entertainment-icon.png"
    },
    {
      "itemId": 6,
      "itemname": "Games",
      "imagepath": "assets/images/games-icon.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    //myaccess = "Allowed";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Hub',
            style: TextStyle(fontSize: 24.0),),
        centerTitle: true,
        backgroundColor: Color(0xFFC88D67),
        //backgroundColor: Color(0xFFC88D67),
        actions: <Widget>[
                    InkWell(
                      child: Icon(Icons.refresh_rounded,
                        size: 28,),
                  onTap: ()  async{
                    print("clicked refresh button");
                    print (DateTime.now());

                    final response = await http.post(
                      Uri.parse(Config.apiGateway+'/api/myaccess'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        //'authorization': 'Bearer '+'1qazxsw2'
                        'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                      },
                      body: jsonEncode(<String, String>{
                        "username": "User1AccessLimit"
                      }),
                    ); // edge compute assignment
                    /*
                    final response = await http.get(
                      Uri.parse('http://192.168.209.103:9080/'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1',
                        'Host': '192.168.2.61'
                      }
                    );/// get http api gate way



                    final response = await http.post(
                      Uri.parse('http://192.168.209.103:9080/api/post1'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1',
                        'Host': '192.168.2.61'
                      },
                      body: jsonEncode(<String, String>{
                        "username": "User1AccessLimit"
                      }),
                    );
                    /// post http api gate way
                     */


                    if (response.statusCode == 200) {
                      print("submitting access check response 200" + response.body);
                      String outputbody = jsonEncode(response.body);
                      print("submitting access check response 200" );
                      print (DateTime.now());
                      print (outputbody.contains("Allowed"));
                      if(outputbody.contains("Allowed")){
                        setState(() {
                          myaccess = "Allowed";
                        });

                      }else{
                        setState(() {
                          myaccess = "Blocked";
                        });

                      }


                    }// end of IF
                    print("After Response myaccess : " + myaccess);

                  }
                    ),

        ],
    ),

      body:GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            mainAxisExtent: 225,


          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () async{



    if ( items[index]["itemname"] == "YouTube") {



       if(myaccess.contains("Allowed")){
          final myresponse = await http.get(
              Uri.parse(Config.apiGateway+'/api/youtubeget'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                //'authorization': 'Bearer '+'1qazxsw2'
                'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
              }
          );
          if (myresponse.statusCode == 200) {
            print("submitting youtube access check response 200" + myresponse.body);
            String outputbody = jsonEncode(myresponse.body);
            print("submitting access check response 200" );
            UtubeItem utubeItem = UtubeItem.fromJson(jsonDecode(myresponse.body));
            myitem = utubeItem.items;

          }else{
            UtubeItem utubeItem = UtubeItem.fromJson(jsonDecode(myresponse.body));
            myitem = utubeItem.items;
          }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  youtube(myitem:myitem,myaccess:myaccess)),
        );
        }else{
          FormHelper.showSimpleAlertDialog(
            context,
            "Student Learning",
            "Daily Entertainment Limit Exceeded , Use Only For Education",
            "OK",
                () {
              Navigator.pop(context);
            },
          );

        }//if else allowed
    }


    if ( items[index]["itemname"] == "Entertainment") {
      if(myaccess.contains("Allowed")){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  entertainment(myaccess:myaccess)),
        );
      }else{
        FormHelper.showSimpleAlertDialog(
          context,
          "Student Learning",
          "Daily Entertainment Limit Exceeded , Use Only For Education",
          "OK",
              () {
            Navigator.pop(context);
          },
        );

      }//if else allowed
    }

      if ( items[index]["itemname"] == "Browser") {
        if(myaccess.contains("Allowed")){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  browser(myaccess:myaccess)),
          );
        }else{
          FormHelper.showSimpleAlertDialog(
            context,
            "Student Learning",
            "Daily Entertainment Limit Exceeded , Use Only For Education",
            "OK",
                () {
              Navigator.pop(context);
            },
          );

        }//if else allowed
      }
    if ( items[index]["itemname"] == "Chatting") {
      if(myaccess.contains("Allowed")){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ChatRooms(myaccess:myaccess)),
        );
      }else{
        FormHelper.showSimpleAlertDialog(
          context,
          "Student Learning",
          "Daily Entertainment Limit Exceeded , Use Only For Education",
          "OK",
              () {
            Navigator.pop(context);
          },
        );

      }//if else allowed
    }
      if ( items[index]["itemname"] == "Games") {
        if(myaccess.contains("Allowed")){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Games(myaccess:myaccess)),
          );
        }else{
          FormHelper.showSimpleAlertDialog(
            context,
            "Student Learning",
            "Daily Entertainment Limit Exceeded , Use Only For Education",
            "OK",
                () {
              Navigator.pop(context);
            },
          );

        }//if else allowed
      }
    if ( items[index]["itemname"] == "Education") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Education(myaccess:myaccess)),
      );
    }

            /*
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemDetail(
                      username:"username",
                      accessToken:"accessToken",
                      itemId: items[index]["itemId"],
                      imagepath: items[index]["imagepath"],
                      itemtype: items[index]["itemtype"],
                      itemname: items[index]["itemname"],
                      description: items[index]["description"],
                      donorname: items[index]["donorname"],
                      recievername: items[index]["recievername"],
                      itemphone: items[index]["itemphone"],
                      itemaddress: items[index]["itemaddress"],
                      itemlocation: items[index]["itemlocation"],
                      adminapproval: items[index]["adminapproval"],
                      alluser:items[index]["alluser"]
                  )));

             */

            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,8),
              child: Container(
               // height: 300,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    SizedBox(height: 20.0),
                    Text(items[index]["itemname"],
                        style: TextStyle(
                            color: Color(0xFFC88D67),
                            fontFamily: 'Varela',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    SizedBox(height: 7.0),
                    Hero(
                        tag: items[index]["itemId"],
                        child: Container(
                            height: 150.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(items[index]["imagepath"]),
                                    fit: BoxFit.contain)))),
                    SizedBox(height: 7.0),





                  ])),
            ),
          )
      ),
     // bottomNavigationBar: BottomNavBar(),
    );
  }
}
