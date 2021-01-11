import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stadion_go_3/views/gameModel.dart';
import 'package:stadion_go_3/views/mygames.dart';

class AvGames extends StatelessWidget {
  int gameId;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context,i)=>new Column(
        children: <Widget>[
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: dummyData[i].category == "football" ? Icon(Icons.sports_soccer) : Icon(Icons.sports_hockey),
                    title: Text(dummyData[i].location),
                    subtitle: Text(dummyData[i].team1 + " vs " + dummyData[i].team2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BUY TICKET'),
                        onPressed: () async {
                          //TODO: Buy ticket in database, cloud function
                          HttpsCallable callable = await FirebaseFunctions
                              .instanceFor(region: 'us-central1')
                              .httpsCallable('getAllGames');

                          final results = await callable();

                          final g = results.data['games'];
                          final ga = "" + g + "";
                          List<dynamic> games = json.decode(ga);

                          print(games[i]['id']);
                          dummyGames.add(GameModel(
                            id: games[i]['id'],
                            team1: games[i]['data']['team1'],
                            team2: games[i]['data']['team2'],
                            location: games[i]['data']['location'],
                            entry: games[i]['data']['entry'],
                            category: games[i]['data']['category'],
                            date: games[i]['data']['date'],
                          ));
                        },
                      ),
                      const SizedBox(width: 8)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}