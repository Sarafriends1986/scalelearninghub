import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/home-screen.dart';

import '../../Config.dart';

class gameplay extends StatefulWidget {
  String gamename;
  String imagepath;
  String myaccess ;
  gameplay ({required this.gamename,required this.imagepath,required this.myaccess});



  @override
  State<gameplay> createState() => _gameplayState(gamename:gamename,imagepath:imagepath,myaccess:myaccess);
}

class _gameplayState extends State<gameplay> {
  _gameplayState ({required this.gamename,required this.imagepath,required this.myaccess});
  String myaccess ;
  String gamename;
  String imagepath;
  String gamestatus = "Playing";
  @override
  void initState() {
    super.initState();
    gamestatus = "Playing";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(gamename,style: TextStyle(fontSize: 24.0),),
          centerTitle: true,
          backgroundColor: Color(0xFFC88D67),
          //backgroundColor: Color(0xFFC88D67),
          actions: <Widget>[
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: 75,
          width: double.infinity,
          // double.infinity means it cove the available width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -7),
                blurRadius: 33,
                color: Color(0xFF6DAED9).withOpacity(0.11),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[


              IconButton(
                icon: Icon(Icons.home,
                    color: Color(0xFFC88D67), size: 40.0),
                onPressed: () async{
                  // Navigator.of(context).pop();
                  //api call for time limit.
                  //String reqtoken = 'Bearer '+'1qazxsw2';
                  final response = await http.post(
                    Uri.parse(Config.apiGateway+'/api/datasend'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      //'authorization': 'Bearer '+'1qazxsw2'
                      'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                    },
                    body: jsonEncode(<String, String>{
                      "username": "User1",
                      "myapp": "Games",
                      "duration":"15"

                    }),
                  );
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen(myaccess:myaccess)),
                  );

                },
              ),


              IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: Color(0xFFC88D67), size: 40.0),
                onPressed: () async{
                  final response = await http.post(
                    Uri.parse(Config.apiGateway+'/api/datasend'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      //'authorization': 'Bearer '+'1qazxsw2'
                      'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                    },
                    body: jsonEncode(<String, String>{
                      "username": "User1",
                      "myapp": "Games",
                      "duration":"14"

                    }),
                  );
                  Navigator.of(context).pop();
                },
              ),


            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              //width: 100.00,
                height: 250.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage(imagepath),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(gamestatus,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

                  ),
                )
            ),
            SizedBox(
              height: 5.0,),
            Container(
              //width: 100.00,
                height: 350.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/images/gamer.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

                  ),
                )
            )


          ],
        )

    )
    ;
  }
}

