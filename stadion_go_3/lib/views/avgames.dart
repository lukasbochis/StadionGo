import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stadion_go_3/views/gameModel.dart';

class AvGames extends StatelessWidget {
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
                            print(results.data);
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