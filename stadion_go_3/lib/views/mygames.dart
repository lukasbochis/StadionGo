import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

import 'gameModel.dart';

class MyGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return dummyGames.isEmpty ? Center(child: Text('Empty')) : new ListView.builder(
      itemCount: dummyGames.length < 1 ? 1 : dummyGames.length,
      itemBuilder: (context,i)=>new Column(
        children: <Widget>[
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: dummyGames[i].category == "football" ? Icon(Icons.sports_soccer) : Icon(Icons.sports_hockey),
                    title: Text(dummyGames[i].location),
                    subtitle: Text(dummyGames[i].team1 + " vs " + dummyGames[i].team2),
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

List<GameModel> dummyGames = [];