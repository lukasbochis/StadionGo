import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import 'avgames.dart';
import 'mygames.dart';
import 'profile.dart';

class MenuScreen extends StatefulWidget{
  MenuScreen();

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {


  MenuScreenState();
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'StadionGo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('StadionGo'),
        ),
        backgroundColor: Color(0xFF00BCD4),
        body: Center(child: NfcScan()),
      ),
    );*/
    return MaterialApp(
        title: 'StadionGo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DefaultTabController(length: 3, child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(text: 'MyGames',),
                Tab(text: 'Available',),
                Tab(text: 'Profile',),
              ],),
              actions: <Widget>[new Icon(Icons.logout)],
            ),
          body: TabBarView(
            children: <Widget>[
              new MyGames(),
              new AvGames(),
              new Profile(),
            ],
          ),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.red,
            child: new Icon(Icons.add),
            //Falls ein Tag entdeckt wird, entsteht ein Ton und gleichzeitig wird die Überprüfung gestartet.
            onPressed: () { FlutterNfcReader.onTagDiscovered().listen((onData) async {
              print(onData.content);
              String content = onData.content;
              content = onData.content.toString().split('anil00')[1];
              print("Test100: " + content);
              List<String> datas = content.split(';');
              //datas[0] = Spiel ID
             //getGameById
              HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
                  'getGameById',
                  options: HttpsCallableOptions(timeout: Duration(seconds: 5)));

              try {
                final HttpsCallableResult result = await callable.call(
                  <String, dynamic>{
                    'gameId': datas[0],
                  },
                );
                print("Game: " + result.data['response']);
              } catch (e) {
                print('caught generic exception');
                print(e);
              }

              // datas[1] = Entrytime
              var parsedDate = DateTime.parse(datas[1]);

              // Wenn jetzige Zeit vor einlass ist oder 4h nach einlass ist, wird eine Fehlermeldung angezeigt.
              if(parsedDate.isBefore(DateTime.now()) || parsedDate.isAfter(DateTime.now().add(new Duration(hours: 4)))){
                _showMyDialog("The barrier are opening... Welcome and Have Fun at watching. ");
              }else {
                _showMyDialog("We are sorry, but you are not able to enter. Look at the entry");
              }
            });
            },
          ),
        ),),
    );
  }

  Future<void> _showMyDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Stadion Go'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.add_circle_sharp),
              title: Text('FC Barcelona vs Real Madrid'),
              subtitle: Text('01.01.2021, 17:00'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: null, child: const Text('Register for game'))
              ],
            ),
            /*Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 220,
                      width: double.maxFinite,
                      child: Card()
                    );
                  },
                )
            ),*/
          ],
        ),
      ),
    );
  }
}

class NfcScan extends StatefulWidget {
  NfcScan({Key key}) : super(key: key);

  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  TextEditingController writerController = TextEditingController();

  @override
  initState() {
    super.initState();
    writerController.text = 'Put in stadion name';
    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    writerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: writerController,
        ),
        RaisedButton(
          onPressed: () {
            FlutterNfcReader.read();
          },
          child: Text("Read"),
        ),
        RaisedButton(
          onPressed: () {
            FlutterNfcReader.write(" ", writerController.text).then((value) {
              print(value.content);
            });
          },
          child: Text("Write"),
        )
      ],
    );
  }

}