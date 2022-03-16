import 'package:flutter/material.dart';
import 'package:utm_connect/models/event.dart';
import 'package:utm_connect/models/event_api.dart';
import 'package:utm_connect/views/widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Event> _events;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    print('OKE1');
    getEvents();
  }

  Future<void> getEvents() async {
    _events = await EventApi.getEvent();
    setState(() {
      _isloading = false;
    });
    print(_events);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.event),
            SizedBox(
              width: 10,
            ),
            Text('Event'),
          ],
        ),
      ),
      body: EventCard(
          title: "IOD",
          cookTime: "NEW",
          people: "30",
          thumbnailUrl:
              "https://www.utm.my/sport-facilities/files/2019/02/WhatsApp-Image-2019-02-17-at-8.40.53-AM.jpeg"),
    );
  }
}
