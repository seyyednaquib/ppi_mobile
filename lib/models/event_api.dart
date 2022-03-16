import 'dart:convert';

import 'event.dart';
import 'package:http/http.dart' as http;

class EventApi {
// var axios = require("axios").default;

// var options = {
//   method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {limit: '18', start: '0', tag: 'list.recipe.popular'},
  // headers: {
  //   'x-rapidapi-host': 'yummly2.p.rapidapi.com',
  //   'x-rapidapi-key': 'b015ea43famsh968d1f5de5d1d22p1fec3djsnf67381bea591'
  // }
// };

// axios.request(options).then(function (response) {
// 	console.log(response.data);
// }).catch(function (error) {
// 	console.error(error);
// });
  static Future<List<Event>> getEvent() async {
    var uri = Uri.http('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '18', "start": '0', "tag": 'list.recipe.popular'});

    var response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': 'b015ea43famsh968d1f5de5d1d22p1fec3djsnf67381bea591',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    //loop because its an array of events feed
    for (var i in data['feed']) {
      _temp.add(i['content']['detail']);
    }

    return Event.eventsFromSnapshot(_temp);
  }
}
