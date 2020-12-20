import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class GameModel {
  final String category;
  final String entry;
  final String location;
  final String team1;
  final String team2;


  GameModel({this.category,this.entry,this.location,this.team1,this.team2});




}
Future<List> getData() async{
  HttpsCallable callable = FirebaseFunctions.instanceFor(region: "us-central1").httpsCallable("helloWorld");
  final results = await callable();
  print(results.data.toString());
}

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