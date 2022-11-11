import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:scalelearninghub/screens/home/home-screen.dart';

import '../../Config.dart';

class educationpage extends StatefulWidget {
 String subject;
 String myaccess ;
 educationpage ({required this.subject,required this.myaccess});


  @override
  State<educationpage> createState() => _educationpageState(subject:subject,myaccess:myaccess);
}

class _educationpageState extends State<educationpage> {
  String subject;
  String myaccess ;
  _educationpageState ({required this.subject,required this.myaccess});
  final random = new Random();


  final myController = TextEditingController();
  String website = "Subject Name";
  String searchText = "Search...";
  String imagepath = 'assets/images/browser/browser0.jpg';
  @override
  void initState() {
    super.initState();
    website = "Subject article";
    searchText = "Search...";
    myController.text = "Search...";
  }
  @override
  Widget build(BuildContext context) {
    int intValue = 1;
    return Scaffold(
        appBar: AppBar(
          title:  Text(subject,style: TextStyle(fontSize: 24.0),),
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
                      "myapp": "Education",
                      "duration":"13"

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
                      "myapp": "Education",
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
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    prefixIcon:  IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.green,
                        size: 30.0,
                      ),
                      tooltip: 'Play',
                      onPressed: () {
                        setState(() {
                          //myController.text = "Search...";
                          print("myController.text " + myController.text);
                          website=myController.text;
                          intValue = random.nextInt(6);
                          print( intValue );

                          switch(intValue) {
                            case 1: {
                              // statements;
                              imagepath = 'assets/images/education/education1.jpg';
                            }
                            break;

                            case 2: {
                              //statements;
                              imagepath = 'assets/images/education/education2.jpg';
                            }
                            break;

                            case 3: {
                              //statements;
                              imagepath = 'assets/images/education/education3.jpg';
                            }
                            break;
                            case 4: {
                              // statements;
                              imagepath = 'assets/images/education/education4.jpg';
                            }
                            break;

                            case 5: {
                              //statements;
                              imagepath = 'assets/images/education/education5.jpg';
                            }
                            break;
                            case 6: {
                              //statements;
                              imagepath = 'assets/images/education/education6.jpg';
                            }
                            break;

                            default: {
                              //statements;
                              imagepath = 'assets/images/education/education0.jpg';
                            }
                            break;
                          }
                        });
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */

                        setState(() {
                          myController.text = "";
                        });
                      },
                    ),
                    hintText: myController.text,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,),

            Container(
              height: 25,
              //color: Colors.amber[100],
              child: Center(
                child: Text(subject,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),

            ),
            SizedBox(
              height: 25.0,),
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
              child: const Center(child: Text('Coments of the video and the content  Coments of the video and the content  Coments of the video and the content Coments of the video and the content Coments of the video and the content')),
            ),
            SizedBox(
              height: 5.0,),
            Container(
              //width: 100.00,
              height: 250.00,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage(imagepath),
                  fit: BoxFit.fitHeight,
                ),
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
              child: const Center(child: Text('Coments of the video and the content Coments of the video and the content')),
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
              child: const Center(child: Text('Coments of the video and the content Coments of the video and the content')),
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
              child: const Center(child: Text('Coments of the video and the content Coments of the video and the content')),
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
              child: const Center(child: Text('Coments of the video and the content Coments of the video and the content')),
            ),
          ],
        )

    )
    ;
  }
}

