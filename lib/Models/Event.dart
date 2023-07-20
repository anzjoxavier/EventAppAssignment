import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class EventModel {
  int id;
  String title;
  String description;
  String banner_image;
  String date_time;
  String organiser_name;
  String organiser_icon;
  String venue_name;
  String venue_city;
  String venue_country;
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.banner_image,
    required this.date_time,
    required this.organiser_name,
    required this.organiser_icon,
    required this.venue_name,
    required this.venue_city,
    required this.venue_country,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'banner_image': banner_image,
      'date_time': date_time,
      'organiser_name': organiser_name,
      'organiser_icon': organiser_icon,
      'venue_name': venue_name,
      'venue_city': venue_city,
      'venue_country': venue_country,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      banner_image: map['banner_image'],
      date_time: map['date_time'].toString(),
      organiser_name: map['organiser_name'],
      organiser_icon: map['organiser_icon'],
      venue_name: map['venue_name'],
      venue_city: map['venue_city'],
      venue_country: map['venue_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);
}



// "id": 1,
// "title": "GopherCon Europe",
// "description": "A conference for Go developers in Europe. GopherCon Europe is a conference for Go developers that takes place annually in Europe. It's a great opportunity to meet and learn from fellow Gophers, network with companies using Go, and get insights on the latest developments and trends in the Go community.",
// "banner_image": "https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg",
// "date_time": "2023-06-01T09:00:00+02:00",
// "organiser_name": "GopherCon Europe",
// "organiser_icon": "https://icons-for-free.com/iconfiles/png/512/vscode+icons+type+go+gopher-1324451308133525243.png",
// "venue_name": "Beurs van Berlage",
// "venue_city": "Amsterdam",
// "venue_country": "Netherlands"