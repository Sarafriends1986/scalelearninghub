import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/home-screen.dart';

import 'package:scalelearninghub/screens/home/youtubeplay.dart';


import 'package:scalelearninghub/screens/home/UtubeItem.dart';

import 'package:scalelearninghub/Config.dart';

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String title;
  final String user;
  final String viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({

    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final String viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}

class youtube extends StatefulWidget {
  String myaccess ;
  List <Item> myitem;

  youtube ({required this.myitem, required this.myaccess});

  List items = [
    {
      "username": "User Chef",
      "viewcount": "999000",
      "imagepath" : "assets/images/youtube/cooking.jpg",
      "videotitle":"The Cooking VLOG Channel"
    },
    {
      "username": "User Chef",
      "viewcount": "999000",
      "imagepath" : "assets/images/youtube/cooking.jpg",
      "videotitle":"The Cooking VLOG Channel"
    },
  ];

  @override
  State<youtube> createState() => _youtubeState(myitem:myitem,myaccess:myaccess);
}

class _youtubeState extends State<youtube> {
  List <Item> myitem;
  _youtubeState({required this.myitem,required this.myaccess});
  String myaccess ;

  List items = [
    {
      "username": "User Chef",
      "viewcount": 999000,
      "imagepath": "assets/images/youtube/cooking.jpg",
      "videotitle":"The Cooking VLOG Channel"
    },
    {
      "username": "User Chef",
      "viewcount": 999000,
      "imagepath": "assets/images/youtube/cooking.jpg",
      "videotitle":"The Cooking VLOG Channel"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Youtube',
          style: TextStyle(fontSize: 24.0),),
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
                    Uri.parse(Config.apiGateway+'/api/utube/datasend'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      //'authorization': 'Bearer '+'1qazxsw2'
                      'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                    },
                    body: jsonEncode(<String, String>{
                      "username": "User1",
                      "myapp": "Youtube",
                      "duration":"17"

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
                    Uri.parse(Config.apiGateway+'/api/utube/datasend'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      //'authorization': 'Bearer '+'1qazxsw2'
                      'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                    },
                    body: jsonEncode(<String, String>{
                      "username": "User1",
                      "myapp": "Youtube",
                      "duration":"11"

                    }),
                  );
                  Navigator.of(context).pop();
                },
              ),


            ],
          ),
        ),
        body: ListView.builder(
            itemCount: myitem.length,
            itemBuilder:(BuildContext context, int index){
              return  CustomListItem(
              user: myitem[index].username,
              viewCount: myitem[index].viewcount,
              thumbnail: InkWell(
              child: Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                    image:  ExactAssetImage( myitem[index].imagepath),
                    fit: BoxFit.fitHeight,
                    ),
                  )),
                onTap: () {
                  {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  videoplay(image:myitem[index].imagepath,myaccess:myaccess)),
                  );
                  }
                }
              ),
              title: myitem[index].videotitle,
              );

            }

        )
    )
    ;
  }
}

