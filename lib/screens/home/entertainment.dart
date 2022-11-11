import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/entertainmentplay.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'package:scalelearninghub/screens/home/home-screen.dart';

import '../../Config.dart';

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

class entertainment extends StatefulWidget {
  String myaccess ;
  entertainment ({required this.myaccess});

  @override
  State<entertainment> createState() => _entertainmentState(myaccess:myaccess);
}

class _entertainmentState extends State<entertainment> {

  _entertainmentState({required this.myaccess});
  String myaccess ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entertainment',style: TextStyle(fontSize: 24.0),),
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
          padding: const EdgeInsets.all(8.0),
          itemExtent: 106.0,
          children: <CustomListItem>[
            CustomListItem(
              user: 'Netflix',
              viewCount: 999000,
              thumbnail: InkWell(
                  child: Container(
                      width: 100.00,
                      height: 100.00,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: const ExactAssetImage('assets/images/entertainment/netflix-icon.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  entertainmentplay(medianame:"Netflix",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'The Netflix Streaming Videos',
            ),
            CustomListItem(
              user: 'Amazon Prime',
              viewCount: 884000,
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/entertainment/amazonprime-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  entertainmentplay(medianame:"Amazon Prime",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'Amazon Prime Streaming Contents',
            ),
            CustomListItem(
              user: 'vimeo',
              viewCount: 999000,
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/entertainment/vimeo-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  entertainmentplay(medianame:"Vimeo",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'The Vimeo video contents',
            ),
            CustomListItem(
              user: 'dailymotion',
              viewCount: 884000,
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/entertainment/dailymotion-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  entertainmentplay(medianame:"Dailymotion",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'Dailymotion Video Playlist',
            ),
            CustomListItem(
              user: 'Virtual',
              viewCount: 999000,
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/entertainment/vr-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  entertainmentplay(medianame:"Virtual Reality",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'The Virtual Reality video files',
            ),
            CustomListItem(
              user: 'Adult',
              viewCount: 884000,
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/entertainment/adult-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () async{
                    final response = await http.post(
                      Uri.parse(Config.apiGateway+'/api/datasend'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                        //'authorization': 'Bearer '+'1qazxsw2'
                        'X-API-KEY': 'edd1c9f034335f136f87ad84b625c8f1'
                      },
                      body: jsonEncode(<String, String>{
                        "username": "User1",
                        "myapp": "Adult",
                        "duration":"1"

                      }),
                    );
                    FormHelper.showSimpleAlertDialog(
                      context,
                      "Student Learning",
                      "18+ Adult Contents are Blocked",
                      "OK",
                          () {
                        Navigator.pop(context);
                      },
                    );

                  }
              ),
              title: 'Adult 18+ Restricted Contents',
            ),
          ],
        )
    )
    ;
  }
}
