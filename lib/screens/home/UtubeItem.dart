// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UtubeItem utubeItemFromJson(String str) => UtubeItem.fromJson(json.decode(str));

String utubeItemToJson(UtubeItem data) => json.encode(data.toJson());

class UtubeItem {
  UtubeItem({

    required this.items,
  });


  List<Item> items;

  factory UtubeItem.fromJson(Map<String, dynamic> json) => UtubeItem(

    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {

    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.username,
    required this.viewcount,
    required this.imagepath,
    required this.videotitle,

  });

  String username;
  String viewcount;
  String imagepath;
  String videotitle;


  factory Item.fromJson(Map<String, dynamic> json) => Item(
    username: json["username"],
    viewcount: json["viewcount"],
    imagepath: json["imagepath"],
    videotitle: json["videotitle"],

  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "viewcount": viewcount,
    "imagepath": imagepath,
    "videotitle": videotitle,

  };
}