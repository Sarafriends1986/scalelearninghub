import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:scalelearninghub/screens/home/home-screen.dart';

import '../../Config.dart';

class entertainmentplay extends StatefulWidget {
  String medianame;
  String myaccess ;
  entertainmentplay ({required this.medianame,required this.myaccess});

  @override
  State<entertainmentplay> createState() => _entertainmentplayState(medianame:medianame,myaccess:myaccess);
}

class _entertainmentplayState extends State<entertainmentplay> {

  String medianame;
  String myaccess ;
  _entertainmentplayState ({required this.medianame,required this.myaccess});
  final random = new Random();

  int intValue = 1;
  String videostatus = "Playing";
  String mainvideo = "Playing";
  String subvideo1 = "Playing";
  String subvideo2 = "Playing";
  String subvideo3 = "Playing";





  @override
  void initState() {
    super.initState();
    videostatus = "Playing";
    intValue = random.nextInt(4);
    print( intValue );

    switch(intValue) {
      case 1: {
        // statements;
        mainvideo = 'assets/images/entertainment/webseries1.jpg';
        subvideo1 = 'assets/images/entertainment/webseries2.jpg';
        subvideo2 = 'assets/images/entertainment/webseries3.jpg';
        subvideo3 = 'assets/images/entertainment/webseries4.jpg';
      }
      break;
      case 2: {
        // statements;
        mainvideo = 'assets/images/entertainment/webseries2.jpg';
        subvideo1 = 'assets/images/entertainment/webseries3.jpg';
        subvideo2 = 'assets/images/entertainment/webseries4.jpg';
        subvideo3 = 'assets/images/entertainment/webseries1.jpg';
      }
      break;
      case 3: {
        // statements;
        mainvideo = 'assets/images/entertainment/webseries3.jpg';
        subvideo1 = 'assets/images/entertainment/webseries4.jpg';
        subvideo2 = 'assets/images/entertainment/webseries1.jpg';
        subvideo3 = 'assets/images/entertainment/webseries2.jpg';
      }
      break;
      case 4: {
        // statements;
        mainvideo = 'assets/images/entertainment/webseries4.jpg';
        subvideo1 = 'assets/images/entertainment/webseries1.jpg';
        subvideo2 = 'assets/images/entertainment/webseries2.jpg';
        subvideo3 = 'assets/images/entertainment/webseries3.jpg';
      }
      break;
      default: {
        //statements;
        mainvideo = 'assets/images/entertainment/webseries1.jpg';
        subvideo1 = 'assets/images/entertainment/webseries2.jpg';
        subvideo2 = 'assets/images/entertainment/webseries3.jpg';
        subvideo3 = 'assets/images/entertainment/webseries4.jpg';
      }
      break;
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  Text( medianame,style: TextStyle(fontSize: 24.0),),
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
                      "myapp": "Entertainment",
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
                      "myapp": "Entertainment",
                      "duration":"12"

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
                    image: ExactAssetImage(mainvideo),
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
              child: Text('Related Contents',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),

            ),
            SizedBox(
              height: 5.0,),
            CustomListItem(
              user: 'Songs',
              viewCount: 999000,
              thumbnail: Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage(subvideo1),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              title: 'The Most Popular Albums and Songs',
            ),
            SizedBox(
              height: 5.0,),
            CustomListItem(
              user: 'Movies',
              viewCount: 999000,
              thumbnail: Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage(subvideo2),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              title: 'The Super hit Movies Streaming',
            ),
            SizedBox(
              height: 5.0,),
            CustomListItem(
              user: 'Webseries',
              viewCount: 999000,
              thumbnail: Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage(subvideo3),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              title: 'Most viewed Webseries Streaming',
            ),
          ],
        )

    )
    ;
  }
}

class _EntertainmentDescription extends StatelessWidget {
  const _EntertainmentDescription({
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String title;
  final String user;
  final int viewCount;

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
            '343 views',
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
  final int viewCount;

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
            child: _EntertainmentDescription(
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

