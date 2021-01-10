import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
FirebaseFunctions functions = FirebaseFunctions.instance;
class GameModel {
  final String category;
  final String entry;
  final String location;
  final String team1;
  final String team2;
  GameModel({this.category,this.entry,this.location,this.team1,this.team2});
  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(category: json['category'], entry: json['entry'], location: json['location'], team1: json['team1'], team2: json['team2']);
  }
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
  if (jsonData != null) {
    (jsonData[0].data).forEach((element) {
      final student = GameModel.fromJson(element);
      print(student);
    });
  }
}
const baseUrl = "https://us-central1-stadiongo.cloudfunctions.net/getAllGames";
// ignore: missing_return
var jsonData;
// ignore: missing_return
Future getData() async{
  final res = await http.get(baseUrl);
  jsonData = json.decode(res.body);
  jsonData.map((data) => new GameModel.fromJson(data)).toList();
  var url = baseUrl;
  print(url);
  testParseJSONArray();
  //return http.get(url);
}
var cate = "s";

List<GameModel> datas = null;

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
      location: "Sükrü Saracoglu",
      team1: "Fenerbahce Istanbul",
      team2: "Galatasaray Istanbul"
  ),
  new GameModel(
      category: getData().toString(),
      entry: "test",
      location: "",
      team2: "",
      team1: ""
  )
];