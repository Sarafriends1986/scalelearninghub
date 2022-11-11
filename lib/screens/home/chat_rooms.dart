import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scalelearninghub/screens/home/home-screen.dart';

import 'package:scalelearninghub/screens/home/chat_screen.dart';

import 'package:snippet_coder_utils/FormHelper.dart';

import '../../Config.dart';

class _ChatRoomDescription extends StatelessWidget {
  const _ChatRoomDescription({
    required this.title,
    required this.user,
  });

  final String title;
  final String user;

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
            'Click to JOIN',
            style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color:Color.fromRGBO(0, 155, 0, 0.8),)
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
  });

  final Widget thumbnail;
  final String title;
  final String user;

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
            child: _ChatRoomDescription(
              title: title,
              user: user,
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

class ChatRooms extends StatefulWidget {
  String myaccess ;
  ChatRooms ({required this.myaccess});

  @override
  State<ChatRooms> createState() => _ChatRoomsState(myaccess:myaccess);
}

class _ChatRoomsState extends State<ChatRooms> {

  _ChatRoomsState({required this.myaccess});
  String myaccess ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChatRooms',style: TextStyle(fontSize: 24.0),),
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
                      "myapp": "Chat",
                      "duration":"16"

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
                      "myapp": "Chat",
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
          padding: const EdgeInsets.all(8.0),
          itemExtent: 106.0,
          children: <CustomListItem>[
            CustomListItem(
              user: '200 Users',
              thumbnail: InkWell(
                  child: Container(
                      width: 100.00,
                      height: 100.00,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/chat/whatsapp-icon.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChatScreen(chatname:"WhatsApp Room",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'WhatsApp Chat Room',
            ),
            CustomListItem(
              user: '250 users',
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/chat/viber-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChatScreen(chatname:"Viber Room",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'Viber Chat Room',
            ),
            CustomListItem(
              user: '300 users',
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/chat/skype-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChatScreen(chatname:"Skype Room",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'Skype Chat Room',
            ),
            CustomListItem(
              user: '430 users',
              thumbnail:  InkWell(
                child: Container(
                      width: 100.00,
                      height: 100.00,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('assets/images/chat/yahoo-icon.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChatScreen(chatname:"Yahoo Room",myaccess:myaccess)),
                      );
                    }
                  }
              ),


              title: 'Yahoo Chat Room',
            ),
            CustomListItem(
              user: '120 users',
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/chat/zoom-icon.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ChatScreen(chatname:"Zoom Room",myaccess:myaccess)),
                      );
                    }
                  }
              ),
              title: 'Zoom Chat Room',
            ),
            CustomListItem(
              user: '324 users',
              thumbnail: InkWell(
                child: Container(
                    width: 100.00,
                    height: 100.00,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/chat/tynder-icon.jpg'),
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
              title: '18+ Tynder Chat rooms',
            ),
          ],
        )
    )
    ;
  }
}

