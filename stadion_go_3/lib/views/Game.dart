class Game {
  String category;
  String date;
  String entry;
  String location;
  String team1;
  String team2;

  Game(this.category,this.date,this.entry,this.location,this.team1,this.team2);

  factory Game.fromJson(dynamic json) {
    return Game(json['category'] as String,
        json['date']['stringValue'] as String,
        json['entry']['stringValue'] as String,
        json['location']['stringValue'] as String,
        json['team1']['stringValue'] as String,
        json['team2']['stringValue'] as String);
  }
}