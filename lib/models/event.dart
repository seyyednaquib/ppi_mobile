class Event {
  final String name;
  final String images;
  final double people;
  final String date;

  Event({this.name, this.images, this.people, this.date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        people: json['rating'] as double,
        date: json['totalReviewCount']);
  }

  static List<Event> eventsFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return Event.fromJson(e);
    }).toList();
  }

  @override
  String toString() {
    return 'Event {name : $name}';
  }
}
