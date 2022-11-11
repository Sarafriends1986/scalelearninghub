import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/home-screen.dart';

import '../../Config.dart';

class videoplay extends StatefulWidget {
 String image;
 String myaccess ;


 videoplay ({required this.image,required this.myaccess});

   @override
   State<videoplay> createState() => _videoplayState(image:image,myaccess:myaccess);
}

class _videoplayState extends State<videoplay> {
   String image;
   String myaccess ;

  String videostatus = "Playing";

  _videoplayState({required this.image,required this.myaccess});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Youtube',style: TextStyle(fontSize: 24.0),),
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
    body: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
        //width: 100.00,
        height: 250.00,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: ExactAssetImage(image),
            fit: BoxFit.fitHeight,
          ),
        ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(videostatus,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),

            ),
          )
        ),
        SizedBox(
          height: 5.0,),
        Container(
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                  bottom: BorderSide(),
                )),
            height: 50,
            //color: Colors.amber[500],
           // child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  <Widget>[
              IconButton(
                icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.green,
                      size: 30.0,
                    ),
                tooltip: 'Play',
                onPressed: () {
                  setState(() {
                    videostatus = "Playing";
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.square,
                  color: Colors.green,
                  size: 20.0,
                ),
                tooltip: 'Stop',
                onPressed: () {
                  setState(() {
                    videostatus = "Stopped";
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  //semanticLabel: 'Text to announce in accessibility modes',
                ),
                tooltip: 'Like',
                onPressed: () {
                  setState(() {
                    videostatus = "Liked";
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: Colors.green,
                  size: 30.0,
                ),
                tooltip: 'Volume',
                onPressed: () {
                  setState(() {
                    videostatus = "Volume Up";
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.fast_forward,
                  color: Colors.blue,
                  size: 36.0,
                ),
                tooltip: 'Forward',
                onPressed: () {
                  setState(() {
                    videostatus = "Fast Forward";
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.fast_rewind,
                  color: Colors.blue,
                  size: 36.0,
                ),
                tooltip: 'Rewind',
                onPressed: () {
                  setState(() {
                    videostatus = "Fast Rewind";
                  });
                },
              ),

            ],
          ),
        ),
        SizedBox(
          height: 10.0,),
        Container(
          height: 25,
          //color: Colors.amber[100],
          child: Text('Comments',
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          ),

        ),
        SizedBox(
          height: 5.0,),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF)),
                left: BorderSide(color: Color(0xFFFFFFFF)),
                right: BorderSide(),
                bottom: BorderSide(),
              )),
          height: 50,
          //color: Colors.amber[500],
          child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
        ),
        SizedBox(
          height: 5.0,),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xFFFFFFFF)),
              left: BorderSide(color: Color(0xFFFFFFFF)),
              right: BorderSide(),
              bottom: BorderSide(),
            )),
          height: 50,
          //color: Colors.amber[500],
          child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
        ),
        SizedBox(
          height: 5.0,),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF)),
                left: BorderSide(color: Color(0xFFFFFFFF)),
                right: BorderSide(),
                bottom: BorderSide(),
              )),
          height: 50,
          //color: Colors.amber[500],
          child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
        ),
        SizedBox(
          height: 5.0,),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF)),
                left: BorderSide(color: Color(0xFFFFFFFF)),
                right: BorderSide(),
                bottom: BorderSide(),
              )),
          height: 50,
          //color: Colors.amber[500],
          child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
        ),
        SizedBox(
          height: 5.0,),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF)),
                left: BorderSide(color: Color(0xFFFFFFFF)),
                right: BorderSide(),
                bottom: BorderSide(),
              )),
          height: 50,
          //color: Colors.amber[500],
          child: const Center(child: Text('User : Coments of the video and the content Coments of the video and the content')),
        ),
      ],
    )

    )
    ;
  }
}


