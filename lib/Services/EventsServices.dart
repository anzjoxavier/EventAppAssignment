import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:eventapp/Models/Event.dart';

class EventsServices {
  final String url =
      "https://sde-007.api.assignment.theinternetfolks.works/v1/event";
  static Future<List<EventModel>> getAllEvents() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
            "https://sde-007.api.assignment.theinternetfolks.works/v1/event"),
      );
      // final responseinJson = json.decode(response.body);

      final events = (json.decode(response.body))["content"]["data"] as List;
      print(events[0]);
      final listOfEvents =
          events.map((e) => EventModel.fromJson(json.encode(e))).toList();

      return listOfEvents;
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
