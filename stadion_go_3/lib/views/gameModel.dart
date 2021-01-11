import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Game.dart';
FirebaseFunctions functions = FirebaseFunctions.instance;
class GameModel {
  final String id;
  final String category;
  final String date;
  final String entry;
  final String location;
  final String team1;
  final String team2;

  GameModel({this.id,this.category,this.date,this.entry,this.location,this.team1,this.team2});
  /*
  factory GameModel.fromJson(dynamic json) {
    return GameModel(json['category'] as String,
        json['date']['stringValue'] as String,
        json['entry']['stringValue'] as String,
        json['location']['stringValue'] as String,
        json['team1']['stringValue'] as String,
        json['team2']['stringValue'] as String);
  }*/
  @override
  String toString() {
    return 'Student: {category = $category, entry = $entry, location = $location, team1 = $team1, team2 = $team2}';
  }
}
void testParseJSONArray() {
  final jsonString = r'''
      [
        {
          "category": "John",
          "entry": "15:00"
        },
        {
          "category": "Peter",
          "entry": "22:00"
        }
      ]
  ''';
  // Use jsonDecode function to decode the JSON string
  // I assume the JSON format is correct
  //final json = jsonDecode(jsonData);
  print(jsonData[0].data);
  print(jsonString);
  // The JSON data is an array, so the decoded json is a list.
  // We will do the loop through this list to parse objects.

  /*
  if (jsonData != null) {
    (jsonData[0].data).forEach((element) {
      final student = GameModel.fromJson(element);
      print(student);
    });
  }*/
}
const baseUrl = "https://us-central1-stadiongo.cloudfunctions.net/getAllGames";
// ignore: missing_return
var jsonData;
// ignore: missing_return

/*
Future<List<GameModel>> getData() async{
  List<GameModel> games;

  HttpsCallable callable = FirebaseFunctions.instance
      .httpsCallable('getAllGames');
  await callable().then((v) =>
    v.data.foreach((f) {
      games.add(GameModel(
          f["category"]["stringValue"],
          f["team2"]["stringValue"],
          f["team1"]["stringValue"],
          f["entry"]["stringValue"],
          f["date"]["stringValue"],
          f["location"]["stringValue"]
      ));
    })
  );
  print(games.toString());
  return games;
}*/
var cate = "s";



//List<GameModel> dummyData = getData() as List<GameModel>;


List<GameModel> dummyData = [
  new GameModel(
      category: "football",
      entry: "15:00",
      location: "Camp Nou",
      team1: "FC Barcelona",
      team2: "Real Madrid"
  ),
  new GameModel(
      category: "football",
      entry: "17:00",
      location: "RedBull Arena",
      team1: "RB Salzburg",
      team2: "RB Leipzig"
  ),
  new GameModel(
      category: "football",
      entry: "10:00",
      location: "LinzerStadion",
      team1: "Lask",
      team2: "Rapid Wien"
  )
];
